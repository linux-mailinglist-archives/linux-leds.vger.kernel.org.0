Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BE7388B56
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345066AbhESKGc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 06:06:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:60112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343764AbhESKGb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 06:06:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC37611BF;
        Wed, 19 May 2021 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621418712;
        bh=vLRAqUDVOUyZBuIVfLDnYuJRoaRDQxx4CiH88uG4tWo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gjUouv2G2w5f4wXh4O2wi+afys/NrL8ncYtwR78df9L/C0JAwkI1L2aw+7DjsoosU
         6dk2z9BJcHuCDcwsRY+vJ4NUawbhcTD1xaZZd2UALLVHwgDdhbiJCbc2ViO8cvbo+d
         V7uU18HmFGCGr6DfnrG0tdpE/sJgNMO7EKYrAYx1HQ7iyFQwCx99HBmeH6O/+ECDLr
         cTB6mCCUWA+ri/nemWJW1Y3Zyr+7KnMA4I2u+qqd6nmJQEPl1ZCFN+hkHciXtPm39k
         oIak4g/NvDb5GXsbLP36HVgzfl5xYD9fIyEBXd/Wcrm7Oq0eZCd6PUHPf1Vy9PQJu5
         DnYXbpA1vuE5w==
Date:   Wed, 19 May 2021 12:05:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Message-ID: <20210519120507.3ab8c6a4@coco.lan>
In-Reply-To: <20210519095713.07be987d@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
        <20210519095713.07be987d@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Em Wed, 19 May 2021 09:57:13 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> We have multicolor LED framerwork in Linux. This should be implemented
> via that framework. Please do not implement your own way for RGB leds.
>=20
> Marek

I saw the multicolor LED framework, but IMO it won't fit here.

See, Linux doesn't have direct access to the LED. The access is
provided via ACPI WMI.

The way BIOS reports the type of the led is via a bitmap flag.
So, the same LED can be represented with either single-color
or multi-color one. See:
	https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Sp=
ec-Intel-NUC-NUC10ixFNx.pdf

	Table 2.2 LED Color Type
	Bit Number	Type
	0		Dual-color Blue / Amber
	1		Dual-color Blue / White
	2		RGB-color
	3		Single-color LED

Also as each NUC can support up to 7, and they may have a mix of
single color, dual color and RGB LEDs, if we would use the
multicolor class for the colored ones, that would mean that the
code will need to be duplicated, as, depending on what the BIOS
reports, the LED would need to be exposed either as via
led-multicolor-class or as leds-class.=20

Worse than that, there's even a WMI command that would allow
to "switch LED type" (see page 8). On other words, the BIOS can
expose a "virtual" single-color LED, but actually implemented
in hardware using a RGB one, and this can be changed in real time.

(note: I didn't implement support yet for this, as the hardware
I have doesn't seem to support the "switch LED type" command).

Thanks,
Mauro
