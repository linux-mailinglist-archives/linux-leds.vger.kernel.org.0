Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048243827EC
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 11:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhEQJNh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 05:13:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235951AbhEQJN2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 05:13:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 705A6611C2;
        Mon, 17 May 2021 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621242732;
        bh=6b1MoV4rxHMDe9ruMjs6F2HH22lmkZ793GKTShhLsLM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W9l9gDEdYw6ilWNfdLln0vbHQbjfmdmbaiAgI933zjfgP2fytBPvdC3iUhslXBgez
         kBtFHP7m/g5RKuBpFBExsTHb9lBCelK5NcAwxjoSVgpYJFLRK9//tblJj/fx3M/nmC
         N3oq5VgHmeOfZ6bwlwLOSXsj+dUU8MsZT9ksfoyUHpcFgyx8qZbs72V+IQsp7y8g97
         3uzyoL2fVtwRWpFUwHZUBOT/hFUK2aomcF4bcr2SMd5Y/cEWs6NLZZ9M1UIFf5eqCi
         kjVx2TQ7vXVCXSHVYxNPgkPrsV5cgqiV4Vzx8opvmqumMyQU2D/JYeunbGamgpuEZX
         AQ5tJDWlgOMSA==
Date:   Mon, 17 May 2021 11:12:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210517111207.023919c8@coco.lan>
In-Reply-To: <20210517105749.3180a59c@coco.lan>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
        <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
        <20210516182149.GA3666@localhost>
        <20210517083001.7688acd7@coco.lan>
        <20210517080527.GA18642@amd>
        <20210517105749.3180a59c@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Mon, 17 May 2021 10:57:49 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 17 May 2021 10:05:27 +0200
> Pavel Machek <pavel@ucw.cz> escreveu:

> > No. Take a look at triggers; for example hdd monitor should look very
> > much like existing disk trigger.  

Btw, is there a way to trigger brightness?

When a LED is monitoring the power state, brightness should be
hidden, as, instead of a single brightness parameter, the device
will now have one brightness per different power state, e. g.:

When the LED indicator is measuring *Power State*, the following 
parameters may be available:

    =================================	=======================================
    Parameter				Meaning
    =================================	=======================================
    <power_state>_brightness		Brightness in percent (from 0 to 100)
    <power_state>_blink_behavior	type of blink.
					See :ref:`nuc_blink_behavior`.
    <power_state>_blink_frequency	Blink frequency.
					See :ref:`nuc_blink_behavior`.
    <power_state>_color			LED color
					See :ref:`nuc_color`.
    =================================	=======================================

Where <power_state> is different, depending on the WMI API version:

On version 0.64 (NUC8/9):

    +------------+
    | s0	 |
    +------------+
    | s3	 |
    +------------+
    | s5	 |
    +------------+
    | ready_mode |
    +------------+

Btw, I've no idea what "ready mode" is, as the specs don't explain it.
This particular mode is disabled on my NUC8 device, so I can't test it.

On version 1.0 (NUC10+):

    +------------+
    | s0	 |
    +------------+
    | s3	 |
    +------------+
    | standby	 |
    +------------+

Note: At the specs, "Standby" is actually "Modern Standby". I ended
simplifying it, as just "standby_brightness" sounds good enough.

Thanks,
Mauro
