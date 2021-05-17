Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC3B382458
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 08:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhEQGbX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 02:31:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhEQGbX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 02:31:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E55EB61209;
        Mon, 17 May 2021 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621233007;
        bh=5URBXUpemCQKQLKzWyeSByFQr9lp5HFfnasDIKcXx2I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ag8tid0+KcykMTy8sAm3uL7zsApsOuEuWfw63QF6ZSNqDik5k71msJ5BRCgF65k2K
         9q1xebrMbw+h7gdT72TtOiUsS8xadlc447n2Cl4+BdPL1s3mY7YtceekACOTGutaVA
         D0jjvsQA9TM0IdAyXG0CyTCUSJOH5ibGQFcmbGFfJyVw+0vryqieSO1zL1MTsZlwM0
         0UDrD1Kw/uWpiWaeOk98KYKUAyVZ5VwZheRfRGjbgtoN06XNJikUAIOXBZnarKXZJl
         V2LmJ+9ohUDATD86s8+T2edQuMqVRJSDHwU75yOZx7ddei4lNBUb+dS8zK3EE21DrB
         f9GqkkYzmWBTQ==
Date:   Mon, 17 May 2021 08:30:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210517083001.7688acd7@coco.lan>
In-Reply-To: <20210516182149.GA3666@localhost>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
        <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
        <20210516182149.GA3666@localhost>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Em Sun, 16 May 2021 20:21:50 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
>=20
> > -  Need to validate the uAPI and document it before moving
> >    this driver out of staging. =20
>=20
> >  - Stabilize and document its sysfs interface. =20
>   =20
> Would you mind starting with this one?

Do you mean writing the ABI document for it? Surely I can do that,
but I'm not sure where to put such document while it is on staging.

> We should have existing APIs
> for most of functionality described...

I tried to stay as close as possible to the existing API, but
there are some things that required a different one.

For instance, with WMI rev 0.64 and 1.0, any LED of the device
can be programmed to be a power indicator.

When a LED is programmed this way, there are up to 3 (on rev 1.0) or up
to 4 (on rev 0.64) different brightness level of the LED, and those
are associated with a power status (like S0, S3, S5, "ready mode").

So, the LED API standard "brightness" is meaningless. On the other
hand, when the same LED is programmed to monitor, let's say, the
WiFi or one of the two Ethernets (or both at the same time), the
standard "brightness" level makes sense.

>=20
> We really don't want to merge code with bad API, not even to staging.

See, this is the API that it is exposed on with a NUC8:

	$ tree /sys/class/leds/nuc\:\:front1/
	/sys/class/leds/nuc::front1/
	=E2=94=9C=E2=94=80=E2=94=80 blink_behavior
	=E2=94=9C=E2=94=80=E2=94=80 blink_frequency
	=E2=94=9C=E2=94=80=E2=94=80 brightness
	=E2=94=9C=E2=94=80=E2=94=80 color
	=E2=94=9C=E2=94=80=E2=94=80 device -> ../../../8C5DA44C-CDC3-46B3-8619-4E2=
6D34390B7
	=E2=94=9C=E2=94=80=E2=94=80 ethernet_type
	=E2=94=9C=E2=94=80=E2=94=80 hdd_default
	=E2=94=9C=E2=94=80=E2=94=80 indicator
	=E2=94=9C=E2=94=80=E2=94=80 max_brightness
	=E2=94=9C=E2=94=80=E2=94=80 power
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 autosuspend_delay_ms
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 control
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 runtime_active_time
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 runtime_status
	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 runtime_suspended_time
	=E2=94=9C=E2=94=80=E2=94=80 power_limit_scheme
	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_behavior
	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_frequency
	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_brightness
	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_behavior
	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_frequency
	=E2=94=9C=E2=94=80=E2=94=80 s0_brightness
	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_behavior
	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_frequency
	=E2=94=9C=E2=94=80=E2=94=80 s3_brightness
	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_behavior
	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_frequency
	=E2=94=9C=E2=94=80=E2=94=80 s5_brightness
	=E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../../class/leds
	=E2=94=9C=E2=94=80=E2=94=80 trigger
	=E2=94=94=E2=94=80=E2=94=80 uevent

As the behavior of the LEDs can be dynamically changed, each
LED expose parameters for all types of hardware event it can
deal, but only the ones that are applied to its current indicator
type can be seen/changed.

On other words, the "indicator" tells what type of hardware event
the LED is currently measuring:

	$ cat /sys/class/leds/nuc\:\:front1/indicator=20
	Power State  [HDD Activity]  Ethernet  WiFi  Software  Power Limit  Disabl=
e =20

In this case, as it is measuring the HDD activity. If one tries to
read/write something to, let's say, the Ethernet type, a -EINVAL
is returned:

	$ cat /sys/class/leds/nuc\:\:front1/ethernet_type=20
	cat: '/sys/class/leds/nuc::front1/ethernet_type': Invalid argument

So, before being able to use the ethernet_type, the indicator needs
to be changed:

	$ echo Ethernet > /sys/class/leds/nuc\:\:front1/indicator=20
	$ cat /sys/class/leds/nuc\:\:front1/ethernet_type
	LAN1  LAN2  [LAN1+LAN2] =20

Anyway, I suspect that besides a document under ABI, it would
make sense to add a .rst file describing it under admin-guide,
explaining how to use the ABI.

That should likely be easier to discuss if any changes at the
ABI would be needed. Before moving it out of staging, I would
add another one under Documentation/ABI describing the meaning
of each sysfs node.

Would that work for you?

Thanks,
Mauro
