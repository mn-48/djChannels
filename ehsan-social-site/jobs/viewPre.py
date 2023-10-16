# class JobProfileUpdateAPI(generics.RetrieveUpdateDestroyAPIView):
#     permission_classes = [permissions.IsAuthenticated]
#     queryset= JobProfile.objects.all()
#     serializer_class = JobProfileSerializer
# class JobProfileCreateAPI(APIView):
#     def post(self,request,format=None):
#         try:
#             userpro=UserPro.objects.get(user_id=self.request.user.id, username=self.request.user.username)
#         except:
#             userpro=UserPro.objects.create(user_id=self.request.user.id, username=self.request.user.username)
#         serializer=JobProfileSerializer(data=request.data, context={'request': request})
#         try:
#             jobpro=JobProfile.objects.get(userpro=userpro)
#         except:
#             pass
        
#         if serializer.is_valid():
#             print('valid')
#             if jobpro:
#                 jobpro=serializer.save(userpro=userpro)
#                 jobpro.save()
#             else:
#                 serializer.save(userpro=userpro)
#         return Response(serializer.data)
#     def get(self,request,format=None):
#         try:
#             userpro=UserPro.objects.get(user_id=request.user.id, username=request.user.username)
#         except:
#             userpro=UserPro.objects.create(user_id=request.user.id, username=request.user.username)
#         jobpro=JobProfile.objects.get(userpro=userpro)
#         serializer=JobProfileSerializer(jobpro,many=False)
#         return Response(serializer.data)
# class JobProfileCreateAPI(generics.ListCreateAPIView):
#     permission_classes = [permissions.IsAuthenticated]
#     queryset= JobProfile.objects.all()
#     serializer_class = JobProfileSerializer
#     def perform_create(self, serializer):
#         try:
#             userpro=UserPro.objects.get(user_id=self.request.user.id, username=self.request.user.username)
#         except:
#             userpro=UserPro.objects.create(user_id=self.request.user.id, username=self.request.user.username)
#         serializer.save(userpro=userpro)
# class JobProfileUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
#     permission_classes = [permissions.IsAuthenticated]
#     queryset= JobProfile.objects.all()
#     serializer_class = JobProfileSerializer
#     def perform_create(self, serializer):
#         try:
#             userpro=UserPro.objects.get(user_id=self.request.user.id, username=self.request.user.username)
#         except:
#             userpro=UserPro.objects.create(user_id=self.request.user.id, username=self.request.user.username)
#         serializer.save(userpro=userpro)
    # def create(self, request,serializer, *args, **kwargs):
    #     try:
    #         userpro=UserPro.objects.get(user_id=self.request.user.id, username=self.request.user.username)
    #     except:
    #         userpro=UserPro.objects.create(user_id=self.request.user.id, username=self.request.user.username)
    #     print(userpro)
        
    #     serializer.save(userpro=userpro)
    #     response = super().create(request, serializer, *args, **kwargs)
    #     return Response({
    #         'status': 200,
    #         'message': 'Testimonials fetched',
    #         'data': response.data
    #     })
    # def create(self, request, *args, **kwargs):
    #     data=request.data
    #     try:
    #         userpro=UserPro.objects.get(user_id=self.request.user.id, username=self.request.user.username)
    #     except:
    #         userpro=UserPro.objects.create(user_id=self.request.user.id, username=self.request.user.username)
    #     serializer = self.get_serializer(data=data)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
   