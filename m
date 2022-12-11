Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37BB64939B
	for <lists+linux-leds@lfdr.de>; Sun, 11 Dec 2022 11:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiLKKNp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 11 Dec 2022 05:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiLKKNb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 11 Dec 2022 05:13:31 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B237A11C26
        for <linux-leds@vger.kernel.org>; Sun, 11 Dec 2022 02:12:32 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id f18so9226403wrj.5
        for <linux-leds@vger.kernel.org>; Sun, 11 Dec 2022 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:to:subject:from
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsLU1jQOsv043OLRA0M9teI0lsR/6cXmQrEABXZ/FZ8=;
        b=HWFEw9hzbd1BIEjBGz1OW0Jh8EQzP4uSEJmJJbakuVv+GFIemiEAgvMKjPOkvPA6Z9
         dy0Zsylewot5Yte+sJObujHCD0IGA6VeQrmKWqIcku/Q9ZzSSCv3LnHKkB+cHe0QQDbb
         vA+EesT3dA2yL/qSzH3uCA24Sc3K8UIJd3wvXtco9dQ3eroPH2MrZ14hgZ8Ydsayin4E
         foqEzhiNxnJJDQAH0Kvv/6AbyMqBf0dVgG/x5Jl2aYCezgWb5Djt6QIEbmT1bjKpxOgK
         h7D4UiXvV6rEWgD0tdnTLBuZ0i6D7sHiLv6dO2ymrjGjLN6LBdcDRfGTDQIwzU/5PddV
         oPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:to:subject:from
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsLU1jQOsv043OLRA0M9teI0lsR/6cXmQrEABXZ/FZ8=;
        b=DX5iEV08A4DPE8ehoKx8ml2gkTkuWCV9OlbM8hS2vhvUULB86po4H2dmyjBP52arxj
         /fGFACIb1LT4UEfXxUnq/boiv5UjMg4wkI145VF2w7jLYvvfrMQ5V/fsys5atutzIAdh
         ANKo9PHmdgh638nRcKTtojcEu03qXxpcBakW5gI3qQsiMRYndrU4X6n6QbMIRC6D5q/D
         ySL9Cgx4Qf47ZH+sE69QXFSAURY3iXchX93uHe8y/qn+BFoWwReYb1zdh3s0BvtRNRdL
         P/6JA+3k0+ak9HkOT78/omB34zMQ8ViGpZPZ4K8KnglNNd+wq5jWLxMiEfcUFncaNdrc
         22JA==
X-Gm-Message-State: ANoB5pmwmTMT05Qda/CnsjMib36CY/AmQPuAlyKQM3vySU5ny6+q/Kvh
        b0xL74dgS42hg1+MydvjiIATlWJ/3gB5dRaI
X-Google-Smtp-Source: AA0mqf6EufieWfov4jpvCLRMtTXnKo+M2eNQAmxU1Iw20SqytAx7wgjQ3km1SfZ0Zat+5exrFAgHSw==
X-Received: by 2002:adf:d22f:0:b0:242:1fb8:1ca9 with SMTP id k15-20020adfd22f000000b002421fb81ca9mr6511778wrh.37.1670753550754;
        Sun, 11 Dec 2022 02:12:30 -0800 (PST)
Received: from [10.1.2.121] ([45.136.198.27])
        by smtp.gmail.com with ESMTPSA id n3-20020a056000170300b002368f6b56desm7140719wrc.18.2022.12.11.02.12.29
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 02:12:30 -0800 (PST)
Message-ID: <303d60df-e72d-5d41-da49-84f43f9a4063@gmail.com>
Date:   Sun, 11 Dec 2022 12:12:28 +0200
MIME-Version: 1.0
From:   Adam Vodopjan <adam.vodopjan@gmail.com>
Subject: Bug report for input-leds driver
To:     linux-leds@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Speaking about laptop Acer 5920G and its numlock led. The keyboard lacks a
numpad, instead a block of keys acts as a numpad if I press Fn+NumLk.

The problem in short is when I set /sys/class/leds/input4::numlock/trigger
to some hardware activity like "disk-read" each time the led is ON the
keyboard behaves weird.

To make everything clear let me introduce some modes keyboards work in
related to numlock status:

- numpad_decicated_off: keyboard has a dedicated numpad and numlock is
OFF. The numpad emits arrows, page up/down etc

- numpad_dedicated_on: keyboard has a dedicated numpad and numlock is ON.
The numpad emits numbers

- numpad_overlay_off: there is no dedicated numpad, but some keys
optionally emit numbers, and numlock if OFF. "Overlay" keys emit "normal"
keypresses

- numpad_overlay_on: there is no dedicated numpad, but some keys
optionally emit numbers, and numlock if ON. "Overlay" keys emit numbers

For my laptop I expect modes numpad_overlay_off and numpad_overlay_on to
be only available.

Numlock led is available at /sys/class/leds/input4::numlock. I wanted to
repurpose it. So with the trigger value set to "phy0tpt" instead of
"kbd-numlock" it works as supposed for the led BUT it makes my keyboard
work in numpad_decicated_off mode when the led is ON. When the led is OFF
the keyboard is in mode numpad_overlay_off as it should be.

Here are the keypresses I get from the "overlay" keys.

- the trigger is set to "kbd-numlock", numlock is OFF. As expected, it is
numpad_overlay_off mode:

7 8 9 0
u i o p
j k l ;
m   . /

- the trigger is set to "kbd-numlock", numlock is ON. As expected, it is
numpad_overlay_on mode:

7 8 9 /
4 5 6 *
1 2 3 -
0   . +

Now, I have numlock OFF and set the trigger to "phy0tpt". Some ping runs
in background so the led blinks all the time.

- the led is OFF. As expected, it is numpad_overlay_off mode:

7 8 9 0
u i o p
j k l ;
m   . /

- the led is ON. Surprisingly, it is numpad_decicated_off mode instead of
numpad_overlay_off:

^[[H  ^[[A ^[[5~ /     =     Home Up   PgUp  /
^[[D  ^[[E ^[[C  *     =     Left ??   Right *
^[[F  ^[[B ^[[6~ -     =     End  Down PgDn  -
^[[2~      ^[[3~ +     =     Ins       Del   +

For example with some ping in background and the trigger set to "phy0tpt"
here is what I get clicking "p": p***pp***pp***pp**ppp***pppp**p

Mby it is worth to mention I tried such triggers: disk-activity disk-read
disk-write ide-disk phy0rx phy0tx phy0tpt. All of those demonstrate the
same behavior.

I tried different kernels starting from 4.2 (when input-leds was
introduced) up to 6.0.10. It is all the same.
From 
Message-ID: <fe3acb26-da86-6e03-d91a-27ebbfafe51e@gmail.com>
Date: Sun, 11 Dec 2022 12:11:06 +0200
MIME-Version: 1.0
From: Adam Vodopjan <adam.vodopjan@gmail.com>
Subject: Bug report
