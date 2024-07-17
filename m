Return-Path: <linux-leds+bounces-2284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC879334C7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2024 02:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C751F22A5A
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2024 00:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DB263C;
	Wed, 17 Jul 2024 00:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD9ASvcJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271A80B
	for <linux-leds@vger.kernel.org>; Wed, 17 Jul 2024 00:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721176920; cv=none; b=IN/FaQFiImDubyC4tIKkV4ujBG6XU/yudjRcc32CfF5dCQLtMQ028/Jr2wWc6Wzg+xqWTYwaKerdPNdT49Tkc8QqQoDmpiz1xJB5XnaGsdW+GG6ypE7PKbHyNn+gla9k47s1Klua/kjGEMWeFXEOnUUAilLLLW94qrti5FhktAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721176920; c=relaxed/simple;
	bh=Ipj7zL2iZEnakXJvMlrr02p1LJkZOas0LO9/60TOE9I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lw236uOScgj1jM+nkW3Aa7r69QyJjwkI0cstf6CisKbFjVQ4QM+gKCaIcKoMaDRp181IyK02UeKqWg/ZOeO4pLfWTSn4+kD4uL/NechHl39gy7MhdMola7qoaAhTd4rReRuFN/j1nbAm+TBikWILay4lmk8AHaZeiLKVgzluhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD9ASvcJ; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-81179185d4fso262013241.1
        for <linux-leds@vger.kernel.org>; Tue, 16 Jul 2024 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721176918; x=1721781718; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YMFs5B+zF1u0NUlRV73u/Wnfwv2OGsvFfBNT62+BOC0=;
        b=SD9ASvcJEE/HYaHs9wG7z1h6BRVsa7wM4SXns2uqHvk0AwJDGmVZ9eUE9PFr6DO1ou
         eCaqJRFBcHQworyA2a+H/b/V1W7IYEdpPShpNUgUetsgYNV4n5x983YnVKYq65ATNSsq
         1VFVLKmvGc9BNlt66CXgGB17O/ptDqkwNISgQG4y8gjxetyPuIj/MizAs3BdA/xe8wma
         OQd+aU7uWZvCJND9nmcg0wrLkn6E6cMNQAzAtLfZ0x7jckAb6mOkDqLK4tJyyCXwxBTh
         GAOued4YbFjq+BVAhAXddynn7RjRmHAEsjvzdIkpoyg/xjxF+nlM1FKC8YSih//d1uRA
         RVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721176918; x=1721781718;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMFs5B+zF1u0NUlRV73u/Wnfwv2OGsvFfBNT62+BOC0=;
        b=gKhl4VAHWP2NPPgFxpoJjbR5IPbPDj5aSERFiuqbRVgNqBCDMROJZh9eI8+I8AzrTk
         9aywdmhXbXDiW1t/LxiubLbgaI2hmfu6TzOXuny9w6AHVXMYeecqJPvI4P7DR2/nt4kb
         AsKoGFCHuQhlRUjcMJ5lr1KkKJTJ+r/PfCNg8EnxpfDkgLvYNkBFm1WE+7UyDLyxgEaf
         ZDt8ddvuR4yhFg4WAQP+BEA4stWCugxUwPHXDqB988xhHXT7Gd4vfF54emTORDP7PhjQ
         6Isw9VfhsExF94wn14wQo5COg2+hNoKQ65/KGP+qtKwfkAfdHvXvSfmC/4/GoH+Gpu1K
         AYBg==
X-Gm-Message-State: AOJu0YwnHSGRh6u40xGRbN/SN22/t+otYKdynBBvenoCKUnK/gvNU5SC
	vMPwIIprZ7JokwPGRH59v5/VwMc34crfPq8X4chx9MCOsZd/jC2TgMoSyX5EY7HnVvoaX0tIaD8
	V7S9t7Yl2eBR6Vemnl+vimqrT+cml9t4D
X-Google-Smtp-Source: AGHT+IE22eL+232Jhf8W/hNpU8O9mJDMmXDbNU/x5a2eFMEAyNXolz6z3L5AkVMizIRjksnvXaYYKYN4QyA3RwcLJjY=
X-Received: by 2002:a05:6102:4b0d:b0:48f:df86:dba with SMTP id
 ada2fe7eead31-4915986bcbfmr353996137.5.1721176917654; Tue, 16 Jul 2024
 17:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Tue, 16 Jul 2024 21:41:22 -0300
Message-ID: <CAM_RzfZ=f_Uw0JFXX8Kk6t6FB1gRw=4VAW8sDc5MDEkoHq_fBw@mail.gmail.com>
Subject: [LEDs] leds: remove led_brightness
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

