Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BB462E61E
	for <lists+linux-leds@lfdr.de>; Thu, 17 Nov 2022 21:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbiKQUsX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Nov 2022 15:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbiKQUsW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Nov 2022 15:48:22 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037DC72991
        for <linux-leds@vger.kernel.org>; Thu, 17 Nov 2022 12:48:22 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so6006685wma.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Nov 2022 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=fVtqa/raTpsVZjRNmkq6diQF5X+NEj1gFORFi8rPMHtY+3DnP+fGdl2V3C5BNMzrVy
         onexGotc8OHJA+AgBBJ2hA7gRFSicXrkP8EOcZyEXV6+TGqvEur/UI04l5OsP7HlHGO4
         wDOKXOkq8LZ9tCiF5CyljBrXUWfqdV4fSJLckpr4mfJ1+ScrKqFe2OWQfZcFqaRNM4To
         mPUeGS1iZDm73t4BHsApPFxccWzn6eLqITM5T4a0Xeu13nZLPD42tGPaijALkMwmzhR+
         e3MTw3EXGHDKfW4TMQd7/uieSJS4dUwj/9CvLYdg7Q8qdhuCQz5hDi02QD6i6xjDtsAs
         6jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=TUqpPI8f6asJ67NUD0eSgNWY6V983Qj6s+w6eEs47csHo6aSxd4UfmxizKkYTjtlCg
         3JNas6/WSwLVwhhWO2KqK4erbHD5j2M8jSc9IMxUCoIPKZUq7Pu42YKGduvyTQiWkAi2
         UitN766/zWwD2fTEeLfmKvMXnA+f2tyPvWbVhMV3lykEe7zLnRt7ePdjJmtCm8BEX4yS
         J41kjoqYVCHAmkSsVHdg0q2V/OjUqf2uW5vw5XX5S7hiXokblKeIkkXkz/CjbGHuOI6e
         kOYz9z+1+AcFXL6Oo8gEmWIb/Nv7vYdAzVWm7Sd3xVaTVk6hwFYo1uJd/0CrXWqxkPE/
         vpAw==
X-Gm-Message-State: ANoB5plz6cnHTa8D2BeAfQV3iH+noT6gezNBdxHyMmy68HstkdrocHyK
        ORKG1toHkshp5rKWR036tE0G4SXOE8onv3xm9GU=
X-Google-Smtp-Source: AA0mqf58Sj/N0Xu4lU3PPTxZmrbxIA8A7fNvbXvSRPd/731AZI8kiyJI9LW7/uvc69xC6US0lDh9TYXs86mCpuTgIis=
X-Received: by 2002:a7b:c2aa:0:b0:3cf:5d41:bea1 with SMTP id
 c10-20020a7bc2aa000000b003cf5d41bea1mr2966784wmk.118.1668718100069; Thu, 17
 Nov 2022 12:48:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6020:9098:b0:22a:cc45:1a95 with HTTP; Thu, 17 Nov 2022
 12:48:19 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <harikunda7@gmail.com>
Date:   Thu, 17 Nov 2022 12:48:19 -0800
Message-ID: <CALNCe2Q1kiW3QX9GLcDor3AuQvaWFSvWUPjvq3pd1sPSekSvwA@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:329 listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [harikunda7[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [harikunda7[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
