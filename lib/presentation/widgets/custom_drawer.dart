import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/presentation/widgets/custom_list_tile.dart';
import 'package:diana_proyect/presentation/widgets/primary_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Conversations

List<dynamic> normalDialog = [
  Message(message: "So, how do you like your new flat?", person: "Other"),
  Message(
      message: "It is great! But there are some weird tenants.", person: "Me"),
  Message(message: "You dont say!", person: "Other"),
  Message(
      message: "Im ok with that, it is only temporary though.", person: "Me"),
  Message(
      message: "Hey, you know what? I know what you should do.",
      person: "Other"),
  Message(message: "What's that?", person: "Me"),
  Message(
      message:
          "My father owns a great apartment in the centre. You should check it out!",
      person: "Other"),
  Message(message: "It sounds good! Let's go right now!", person: "Me"),
];

List<dynamic> jobInterviewDialog = [
  Message(
      message: "Good morning, have you found the office easily? I hope so.",
      person: "Other"),
  Message(
      message:
          "Good morning. Oh yes, it hasn't been difficult at all to get here from the bus station.",
      person: "Me"),
  Message(
      message:
          "Tell me about yourself. Your CV says you are a great and qualified professional.",
      person: "Other"),
  Message(
      message:
          "That's correct. I have high qualifications on my MA and also a lot of experience working in the technology industry for quite some years now, with that I would say that I can be very helpful to the company.",
      person: "Me"),
  Message(message: "Why do you want to join this company?", person: "Other"),
  Message(
      message:
          "I want to work with you because this is the best company in the country. Being part of this team will improve my career.",
      person: "Me"),
  Message(
      message:
          "I see your point and I think you could be very helpful so, it would be great if you could start tomorrow, would you? ",
      person: "Other"),
  Message(message: "It would be a pleasure, see you tomorrow!", person: "Me"),
];

List<dynamic> customerServiceDialog = [
  Message(
      message: "Hello Anna, tell me how can I serve you today?",
      person: "Other"),
  Message(
      message:
          "I have a big problem that is concerning me a lot, could you assist me about that?",
      person: "Me"),
  Message(message: "I will be more than happy to assist you", person: "Other"),
  Message(
      message:
          "Now let me tell you what is happening. I got my bill and I'm trying to figure out why have to pay 100 for Internet and telephone services... if I am usually paying 50. Can you explain me that?",
      person: "Me"),
  Message(
      message:
          "In order to help you with this inconvenience, might have your account number",
      person: "Other"),
  Message(message: "Yes, it is 999 99 99 99", person: "Me"),
  Message(
      message:
          "Will you hold for a moment I am checking about that right now. Please stay in line.",
      person: "Other"),
  Message(message: "No problem, I am waiting", person: "Me"),
  Message(
      message:
          "Thank you for waiting Anna, I already checked the bill you have and I was able to see all the charges. You didn't have enought founds in you credit card last month and the bill was rejected so what you see on this bill is the current payment for 50 plus the 50 from last month",
      person: "Other"),
  Message(message: "Oooh okay. I understand what happend. Sorry", person: "Me"),
  Message(
      message: "Perfect Anna. Any other question you might have?",
      person: "Other"),
  Message(message: "No, that was all.", person: "Me"),
  Message(message: "Thank you for calling. Have a good day.", person: "Other"),
];

List<dynamic> reservationServiceDialog = [
  Message(message: "Good morning, how may I assist you?", person: "Other"),
  Message(
      message: "Hi, I have a reservation under the name Smith for tonight.",
      person: "Me"),
  Message(
      message:
          "Great, I see your reservation here. Can I please see your ID and a credit card for incidentals?",
      person: "Other"),
  Message(message: "Ok, take it right here man.", person: "Me"),
  Message(
      message:
          "Thank you. Our check-in time is at 3 pm, but if your room is available earlier, we can certainly check you in sooner.",
      person: "Other"),
  Message(
      message:
          "That would be great. Can you also recommend any nearby restaurants?",
      person: "Me"),
  Message(
      message:
          "Of course, we have a list of recommended restaurants in the area. Would you prefer something casual or fine dining?",
      person: "Other"),
  Message(message: "Casual would be great.", person: "Me"),
  Message(
      message:
          "There's a great pizza place just a few blocks away called Tony's. And if you're looking for something more upscale, I recommend checking out the steakhouse across the street.",
      person: "Other"),
  Message(
      message:
          "Thanks for the recommendations. What time is breakfast served in the morning?",
      person: "Me"),
  Message(
      message:
          "Our breakfast hours are from 7 am to 10 am. Is there anything else I can help you with?",
      person: "Other"),
  Message(message: "No, that's all. Thank you.", person: "Me"),
  Message(message: "You're welcome. Enjoy your stay with us.", person: "Other"),
];

List<dynamic> devolutionDialgoAnalysis = [
  Message(
      message:
          "Good morning! this is customers service, my name is Albert, how can I help you?",
      person: "Other"),
  Message(
      message:
          "Good morning sir, I purchased a Somy Smart TV from your company last month. Unfortunately I'm not satisfied with the item I ordered. There has been a misunderstanding with my order.",
      person: "Me"),
  Message(
      message:
          "Oh, I do apologize for all the inconvenience madam, could you tell me what the problem is and I will help you as much as I can.",
      person: "Other"),
  Message(
      message:
          "Well, the problem is that I ordered a Smart TV but I haven't received it; Instead of that, I have a Plasma Screen TV.",
      person: "Me"),
  Message(
      message:
          "We are very sorry to hear that, would you mind telling me your order number?",
      person: "Other"),
  Message(message: "Yes, of course. My order number is G2832V.", person: "Me"),
  Message(
      message: "I'm sorry, I didn't hear you. Was that 32B?", person: "Other"),
  Message(message: "No, it was 32V.", person: "Me"),
  Message(
      message:
          "Ok, thank you. Please, give me a moment and I will check what the problem is.",
      person: "Other"),
  Message(message: "That's fine.", person: "Me"),
  Message(
      message:
          "Ok, let's see. You ordered a Sony smart TV the 23rd of January with the fast delivery.",
      person: "Other"),
  Message(message: "Yes, that's absolutely right.", person: "Me"),
  Message(
      message:
          "Oh dear, I am sorry to say this but I am afraid we are having problems with our computer system. I see what happened, the system has made a mistake with the shipment of other customer and your Smart TV has been sent to the wrong place.",
      person: "Other"),
  Message(
      message:
          "TWhat are you going to do to resolve the problem? You must know that this is the second time that I have a problem with your company.",
      person: "Me"),
  Message(
      message:
          "I see what you meant but we are not able to do anything at the moment, but in a few days your problem will be solved.",
      person: "Other"),
  Message(message: "Excuse me, can I make a point?", person: "Me"),
  Message(message: "Of course, go ahead.", person: "Other"),
  Message(
      message:
          "The thing is I need it inmediately; when will I have the TV delivered?",
      person: "Me"),
  Message(
      message:
          "Well, I have changed the delivery service company and you'll get your Smart TV by Monday, that is right for you?",
      person: "Other"),
  Message(message: "Have you?", person: "Me"),
  Message(
      message: "Yes, The TV will be at your home as soon as we can.",
      person: "Other"),
  Message(message: "It's great. Thank you for your help.", person: "Me"),
  Message(
      message: "No, thanks to you for choosing our company.", person: "Other"),
  Message(
      message:
          "Erm… sorry, I don't know how it is called but does your company have any way of compensation for this problem?",
      person: "Me"),
  Message(
      message:
          "Yes, of course! For all the inconvenience you can keep the other TV you received as a way of compensation for our mistake.",
      person: "Other"),
  Message(
      message: "Oh, really? That's fantastic! Thank you very much.",
      person: "Me"),
  Message(
      message: "You are welcome. It has been a good deal for you, hasn't it?",
      person: "Other"),
  Message(
      message:
          "Oh yes, It is great for me! Your company knows how treat the customers.",
      person: "Me"),
  Message(
      message: "Of course, we are here to help you. Do you need anything else?",
      person: "Other"),
  Message(message: "No, that's all for now, thank you", person: "Me"),
];

List<dynamic> discussionDialogAnalysis = [
  Message(
      message:
          "I can't believe you're still defending him after what he did! How can you stand there and act like he's innocent?",
      person: "Other"),
  Message(
      message:
          "Because I know him, okay? He's not perfect, but he's not capable of what they're accusing him of.",
      person: "Me"),
  Message(
      message:
          "Are you serious right now? There's literal evidence against him! How can you turn a blind eye to that?",
      person: "Other"),
  Message(
      message:
          "Evidence can be manipulated, you know that! Just because it looks bad doesn't mean it's the whole truth.",
      person: "Me"),
  Message(
      message:
          "Manipulated? Come on, don't be naive! He's been caught red-handed, and you're still making excuses for him.",
      person: "Other"),
  Message(
      message:
          "I'm not making excuses, I'm just saying we shouldn't jump to conclusions without knowing the full story because that's unfair and discriminatory",
      person: "Me"),
  Message(
      message:
          "The full story? What more do you need to see? He's been caught lying multiple times, and now this? It's clear as day!",
      person: "Other"),
  Message(
      message:
          "Look, I understand you're upset, but let's not rush to judgment. We need to give him a chance to explain himself.",
      person: "Me"),
  Message(
      message:
          "He has already done it. He's had a lot of chances, and he's dissapointed in every single one of them! There is no opportunity for him anymore.",
      person: "Other"),
  Message(
      message:
          "Fine, be that way. But just remember, everyone deserves a fair trial, including him.",
      person: "Me"),
  Message(
      message:
          "Fair trial? He's not even on trial yet, and you're already acting like he's the victim here!",
      person: "Other"),
  Message(
      message:
          "I'm not saying he's the victim, I'm just saying we should reserve judgment until all the facts are out.",
      person: "Me"),
  Message(
      message:
          "Well, I've made up my mind. I don't want anything to do with him, and I can't believe you're still defending him.",
      person: "Other"),
  Message(
      message:
          "That's your choice, but don't expect me to abandon him when he needs support the most.",
      person: "Me"),
];

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: colors.surfaceVariant,
      height: double.infinity,
      width: 260,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const PrimaryListTile(),
            const SizedBox(height: 30),
            const DrawerSubtitle(text: "Examples"),
            CustomListTile(
              text: 'Normal  Dialog  Analysis',
              messages: normalDialog,
              optKey: 1,
            ),
            CustomListTile(
              text: 'Job  Interview  Analysis',
              messages: jobInterviewDialog,
              optKey: 2,
            ),
            CustomListTile(
              text: 'Customer  Service  Analysis',
              messages: customerServiceDialog,
              optKey: 3,
            ),
            CustomListTile(
              text: 'Reservation  Service  Analysis',
              messages: reservationServiceDialog,
              optKey: 4,
            ),
            const SizedBox(height: 30),
            const DrawerSubtitle(text: "Others"),
            CustomListTile(
              text: 'Devolution  Dialog  Analysis',
              messages: devolutionDialgoAnalysis,
              optKey: 5,
            ),
            CustomListTile(
              text: 'Discussion  Dialog  Analysis',
              messages: discussionDialogAnalysis,
              optKey: 6,
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 10),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.person_outline_rounded),
                      SizedBox(width: 15),
                      Text('Stephen Abreu Saldaña')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerSubtitle extends StatelessWidget {
  final String text;

  const DrawerSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Text(text,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: colors.secondary,
                  fontWeight: FontWeight.w800,
                  fontSize: 11))),
    );
  }
}
