import asyncio
from datetime import datetime
from graphene import ObjectType, String, Schema, Field

class Query(ObjectType):
    hello = String()

    def resolve_hello(root, info):
        return 'Hello, world!'

class Subscription(ObjectType):
    time_of_day = Field(String)

    async def resolve_time_of_day(root, info):
        while True:
            yield datetime.now().isoformat()
            await asyncio.sleep(1)

schema = Schema(query=Query, subscription=Subscription)

async def main():
    subscription = 'subscription { timeOfDay }'
    result = await schema.execute_async(subscription)
    async for item in result:
        print(item)

asyncio.run(main())