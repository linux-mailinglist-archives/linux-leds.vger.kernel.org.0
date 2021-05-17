Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE1382BF2
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 14:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbhEQMU5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 08:20:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234754AbhEQMU4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 08:20:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EBF361241;
        Mon, 17 May 2021 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621253980;
        bh=+dtwhtQMQDTNx7oQDH89iXtYmlwmei6zujh7Rnhnlww=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=glbVOIuOGEeefXMAjIxA0s9l6qVnSHjwjIFaA5Hmv1TS8mJ4gdrDAirnESwKap/+A
         AzgRttFn7Blas6mKyrhs/PMy0triHIIOh0lU83HeLhUXQYGGl+6QPqAAZLTho4UNgc
         TsQgm5lzz7du2534Ozvis2KhRlvMtLNQ+E0z99shujZbH7AEUms3Mo2+IjU7JBvXMi
         eGh+vRuPqb146yhtedL9QxT9LZw+M2VN2/VmpJfu4DxSCXEbfqroXf7S6fFkbPjdUl
         /up/HF5NOin+jOs63/s3Fo7IZy5PlAbWmLq69A/Ado8GF23L/TpD3MLcXYvnI2PbiI
         51pobsdjDX3hQ==
Date:   Mon, 17 May 2021 14:19:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210517141935.4a7cb905@coco.lan>
In-Reply-To: <20210517080527.GA18642@amd>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
        <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
        <20210516182149.GA3666@localhost>
        <20210517083001.7688acd7@coco.lan>
        <20210517080527.GA18642@amd>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Mon, 17 May 2021 10:05:27 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> No. Take a look at triggers; for example hdd monitor should look very
> much like existing disk trigger.

Hmm... after looking at triggers, I'm not sure if this is the right
interface, nor if we're talking about the same thing.

See, at least the way ledtrig-disk.c uses it, two drivers are triggering 
the LED based on software events:

	drivers/ata/libata-core.c:      ledtrig_disk_activity(!!(qc->tf.flags & ATA_TFLAG_WRITE));
	drivers/ide/ide-disk.c: ledtrig_disk_activity(rq_data_dir(rq) == WRITE);

This is not how the NUC LEDs are work. On NUC, the hardware itself 
triggers the event and/or blinks the LED(*).

(*) By default, blink is enabled only when the device is suspended
    or it is hibernating.

There's no need to do any software emulation.

The API is meant to just program the hardware (and/or the firmware) 
for it to do the behavior expected by the user.

So, for instance, setting the indicator event that will trigger the
LED is done by sending a WMI message for this GUID object:
8C5DA44C-CDC3-46b3-8619-4E26D34390B7 (somewhat similar to using
the way ACPI works, but WMI is a different firmware interface).

The method at the WMI API which sets the LED indicator is this one:

	0x05 message (Set an Indicator option for the LED type)

Such method receives two parameters. The first one is the LED 
number, which can be:

	0 - Power button LED
	1 - HDD LED
	2 - Skull LED
	3 - Eyes LED
	4 - Front LED 1
	5 - Front LED 1
	6 - Front LED 1

The second one tells which hardware event will trigger the LED:

=====	==============	=======================================================
Value	Indicator type	Meaning
=====	==============	=======================================================
0	Power State	Shows if the device is powered and what power level
			it is (e. g. if the device is suspended or not, and
			on which kind of suspended level).
1	HDD Activity	Indicates if the LED is measuring the hard disk (or
			SDD) activity.
2	Ethernet	Indicates the activity Ethernet adapter(s)
3	WiFi		Indicates if WiFi is enabled
4	Software	Doesn't indicate any hardware level. Instead, the LED
			status is controlled via software.
5	Power Limit	Changes the LED color when the computer is throttling
			its power limits.
6	Disable		The LED was disabled (either by BIOS or via WMI).
=====	==============	=======================================================

There is an example at page 7 of the datasheet:

	https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL_WMI_LED_0.64.pdf

Where it shows what happens if the WMI message is filled with:

	<0x05>  <0x00>  <0x01>

On such example, it changes the behavior of the button named "Power button" 
to change it to monitor the disk activity, instead of monitoring if the
device is powered on or not.

Such setting is even persistent after rebooting, and the event is
hardware/firmware triggered.

So, IMO, it would only makes sense to use something else from the LED
class if are there a way for the sysfs nodes to dynamically be shown/hidden
when the indicator changes.

At least on my eyes, that doesn't seem to be what triggers do.

Thanks,
Mauro
