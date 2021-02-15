Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC1231C12A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 19:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBOSIX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Feb 2021 13:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhBOSIV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Feb 2021 13:08:21 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3ECC061574
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 10:07:41 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id x14so7185106qkm.2
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 10:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FjL3bGsKN4nNEckTnZ781kw4sYUri7Vg5u7pKoqSQ4w=;
        b=wffB8JYDrYvNhF8aeb2t6NxZQu1RY9UOtTgBkkwOOaUMgh5tu0A71OfXnDmwWheCPx
         JDWf0DSnIOI4JmVZ9W9d4aqv8gnatEoAIxRkHbydowLRjfYgFi4oqIq1XQqImWd0Ks6J
         lmOgoc7uwa7+6w/ujJ8n6GR+On89M0rq+H+5/3gcm1QoNeqXQnabVGlxgKxSTKiIgz6b
         L4LfkDbhhSo1M5YmYwdBn1ke+pwatu+IUPSfkPKe/rg0bMCpTfrKzlONqMnaiUa9Fx+3
         EWfsi+WolPDjnwmhkIGggWsFHCD8ff5/M1+uoj8DIlJtFrMqWEz/qZMggH5dqBtmehOU
         YN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FjL3bGsKN4nNEckTnZ781kw4sYUri7Vg5u7pKoqSQ4w=;
        b=aOphYWO2rfq9eRB+1gJuzuwyqC5VXXLVYvE1ERsjEA3CKwvFXRrWEbAIh+92uOKzo0
         iciRTjBWd0KlX26Atm68G0ivlvFU5D2MRTuR0W1CdDfpAc1PvAf1nPftIEpHNsZb2Ihh
         vv5WzXnbmX/0LcMrZ7vQ44ezHp/Cb67DlIMybs0TbS5TeR0sCeLM+cpQay4aVhJZ37lf
         /iaBpVHJbclFej/oBe89pnFK5FNPhdhOZfSOTuP/VK1XN1hZZ7jLWuBQntoIkR1krVeF
         PXvquzhY2c7JnZTkamKBKn+WjP9vUEm3RIcSyveyZvikuikYOYupRglAHl7E+274fppm
         R91w==
X-Gm-Message-State: AOAM531zWSxHo+IHhaah3eWGczVRe+MDxVeoD7adbRWZSOZTJHvdPJyc
        Ip0LxNv1VSPyoB86OCnac+NqWK7edZim43f8DGa4Eg==
X-Google-Smtp-Source: ABdhPJzfkRGYdyBeUGYpEQ1Q7dq4jWR5b71B+yuM0fF2jjb0xwBrDuMjCJrLG5bC5Ps7hZC8WbgY/yTbsmDlUZvYLYY=
X-Received: by 2002:a05:620a:cd6:: with SMTP id b22mr15415318qkj.451.1613412460512;
 Mon, 15 Feb 2021 10:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-3-roderick@gaikai.com>
 <20210215154045.4ac27ec0@nic.cz>
In-Reply-To: <20210215154045.4ac27ec0@nic.cz>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 15 Feb 2021 10:07:29 -0800
Message-ID: <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] HID: playstation: add microphone mute support for DualSense.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        pobm@protonmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Feb 15, 2021 at 6:40 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sun, 14 Feb 2021 16:45:47 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > The DualSense controller has a built-in microphone exposed as an
> > audio device over USB (or HID using Bluetooth). A dedicated
> > button on the controller handles mute, but software has to configure
> > the device to mute the audio stream.
> >
> > This patch captures the mute button and schedules an output report
> > to mute/unmute the audio stream as well as toggle the mute LED.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Is the microphone supported via Linux? I.e. is there an audio driver
> for it?

Yes and no. The microphone is supported using USB, not yet using
Bluetooth (uses a custom protocol). Actually there are various other
audio features in the DualSense (headphone jack, speaker, volume
controls,..) and they all work using custom protocols. We were
planning to defer this work through future patches as the features are
very complicated and need a deep analysis on how to realize them. For
example audio controls work through HID, but for USB the audio driver
is a generic hda audio device I think. Bluetooth is a custom protocol
and will be yet a different audio driver somewhere.

> If it is, look at the audio-micmute LED trigger.
>

I'm not sure if the expected behavior for the DualSense is similar to
the standard audio mute use cases. My understanding of these triggers
(please correct me if I'm wrong) is for e.g. an audio driver or user
space to send a signal to anything registering for a particular
trigger. In this case a global micmute. Is that, right?

In our case for PlayStation games, there are often multiple
controllers connected and each user has their own microphone in their
controller. All can function at the same time (different from a
standard PC use case). That's why I'm wondering if this makes sense.I
know we are on Linux, but for Sony we want to properly support such
use cases.

> If you can't use the audio-micmute trigger because the microphone isn't
> supported via Linux, I still think the LED should the LED should be
> read-write. You can then register a LED private trigger. The driver should
> change the state of the LED according to the microphone mute state only
> if these trigger is enabled.
>
> Marek

Roderick
