Return-Path: <linux-leds+bounces-2290-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A690D9384F7
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 16:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BA012812AE
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 14:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FB21DFD8;
	Sun, 21 Jul 2024 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuy40SBD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBDD523A
	for <linux-leds@vger.kernel.org>; Sun, 21 Jul 2024 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721571810; cv=none; b=c0nv5YlsRwZogQn8nVlrRugCKYrHxtbEn8fcbERwuBHg8FktRZaZNRPeRmoPBER2lNz+3qwH2SrChwIn6DvSGRTWFRj/SA8b/J0A8kra5bCWOkjqWQeEzhw/2wZizrMkWfP8CoQzhBY4xfvi/vvjphTjNam4y8o0gB3iMpZbtko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721571810; c=relaxed/simple;
	bh=Ipj7zL2iZEnakXJvMlrr02p1LJkZOas0LO9/60TOE9I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H3iBPQNC5mOJz3O9vgPfppiUx5eIW22NxO3+yk9cwBXQjj6ITjGunmBYHHcJlbNTJLhK5nEQpxm92KtN4BL9sfMeZ58ze/q2l6HYqzhwwN+lGSgsM5mdzKFPoxG8rbsbU7YogiDXteKtsU6L5iBEj0VN304Tl8Fzm9Nmq8ywwdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuy40SBD; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b7a3e468a9so19681506d6.1
        for <linux-leds@vger.kernel.org>; Sun, 21 Jul 2024 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721571808; x=1722176608; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YMFs5B+zF1u0NUlRV73u/Wnfwv2OGsvFfBNT62+BOC0=;
        b=fuy40SBDE0yZwvJs1ulYjBinVyJyxN/jqe9sAa6/r7IkLiT5jmhXwZuSna/fbnOyjn
         J8vEnoJwve1S2xEyiqiWKdO5f4arG69XI7/OVX+2rqlfRVdF/eDkWlN4V5jdwSLkwPsN
         EPDfCQBUkCHBTA1frqWOFJZv1Sf7CtDA+xLNhDJisOrjUmdzZwKJv/9VjZp/Qg2znrZq
         EZD58Z7wpjcktXjRKoGwdM7qEC8sOcuwD9373IBzLTOO5Tmji/JIcJ+RiSFWdT6DzOs6
         vZPQuWdTiQ+q9zBbykP1+0wNtOUuuk9Ar1kjMQ14Jm7pJoAF/+2FwcZuXCMFpwRTBLpg
         WQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721571808; x=1722176608;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMFs5B+zF1u0NUlRV73u/Wnfwv2OGsvFfBNT62+BOC0=;
        b=Nvhgyaj5vcAEvW0WVpKijfXCO6xEpmplWHnWYNpm12MOie8w8CRhHKcGfBYYNveLlM
         fmgtpoQOJ9ANFS5EArnwGREdKACoRcJc0Avyc8IcgqLYeJvI2O7e9xgK/W9FhMq5szhN
         c01nLg2J2neRjfmpDEJUbE9f724L+OIZu7S3YgDbds8B8XhJz3tKCzGCOA05bwKKk8SF
         uvvDu1o8BhFYaGLukzuHJKdu5Ciiq9WLNPOuRrlU8mebxM1rh6tVuhnt6vM2aZp29Hiz
         gZMO+6gRubtiPtU+V72bO4cFrfpWDxZ0tpGZ5TasaLStOnI5O5BfhdwrM+YwN4zCQ67Y
         deKA==
X-Gm-Message-State: AOJu0YwabsLMx40V1fufN7vPDyKj4eZia3F31Gz1W0kj8eIiyqypWyEu
	4+TdaUIkZSFw83Pwjkuyh/8IT7YwBGYe62YEN//H5skCT8gorAoSIRDfUvN2FPFIlnb/tXbYUCU
	MDfHUf9ou7rBR0L85ngXUW2K5B1O0+n3I
X-Google-Smtp-Source: AGHT+IEgAf+YwJkhZWpEC4Q7NhFzuViV9oOyrs/2sImuhA0ChKAOd1XcGO0PpxGbslwdo7u4i4zlqw7FluNZNRGCu3w=
X-Received: by 2002:a05:6214:c2f:b0:6b5:e51d:441d with SMTP id
 6a1803df08f44-6b9610d5d24mr56357256d6.41.1721571808010; Sun, 21 Jul 2024
 07:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Sun, 21 Jul 2024 11:22:52 -0300
Message-ID: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
Subject: [RESEND LEDs] leds: remove led_brightness
To: linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi community, I hope this email finds you well
I maked a change in kernel linux, for fulfill a TODO in
drivers/leds/TODO that say:
>* On/off LEDs should have max_brightness of 1
>* Get rid of enum led_brightness
>
>It is really an integer, as maximum is configurable. Get rid of it, or
>make it into typedef or something.

Then I removed the led_brightness. And in the files that enum
led_brightness was used i replace to "int" ... And in the file
"include/linux/leds.h" I created constants like:
+#define LED_OFF  0
+#define LED_ON   1
+#define LED_HALF 127
+#define LED_FULL 255

because in some files when has a compare like "brightness == LED_OFF"
it will work yet.

The includes/linux/leds.h diff:
-/* This is obsolete/useless. We now support variable maximum brightness. */
-enum led_brightness {
-       LED_OFF         = 0,
-       LED_ON          = 1,
-       LED_HALF        = 127,
-       LED_FULL        = 255,
-};
+// default values for leds brightness
+#define LED_OFF  0
+#define LED_ON   1
+#define LED_HALF 127
+#define LED_FULL 255

 enum led_default_state {
        LEDS_DEFSTATE_OFF       = 0,
@@ -127,15 +125,15 @@ struct led_classdev {
         * that can sleep while setting brightness.
         */
        void            (*brightness_set)(struct led_classdev *led_cdev,
-                                         enum led_brightness brightness);
+                                         int brightness);
        /*
         * Set LED brightness level immediately - it can block the caller for
         * the time required for accessing a LED device register.
         */
        int (*brightness_set_blocking)(struct led_classdev *led_cdev,
-                                      enum led_brightness brightness);
+                                      int brightness);
        /* Get LED brightness level */
-       enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
+       int (*brightness_get)(struct led_classdev *led_cdev);

        /*
         * Activate hardware accelerated blink, delays are in milliseconds
@@ -486,7 +484,7 @@ int devm_led_trigger_register(struct device *dev,
 void led_trigger_register_simple(const char *name,
                                struct led_trigger **trigger);
 void led_trigger_unregister_simple(struct led_trigger *trigger);
-void led_trigger_event(struct led_trigger *trigger,  enum
led_brightness event);
+void led_trigger_event(struct led_trigger *trigger,  int event);
 void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_on,
                       unsigned long delay_off);



How the kernel has a lot of files that use this led_brightness, the
change is very very big.
I have some questions:

Does my change make sense?

How can I split the change into several patches for sending to
different email lists and still have the split change make sense in
the email lists I'm going to send it to? can I reference the commit in
which I delete the enum?

