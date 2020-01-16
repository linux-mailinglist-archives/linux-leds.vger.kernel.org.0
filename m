Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25E113D88A
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2020 12:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgAPLFs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 16 Jan 2020 06:05:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:56806 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbgAPLFs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 16 Jan 2020 06:05:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 734F8AEF9;
        Thu, 16 Jan 2020 11:05:46 +0000 (UTC)
Date:   Thu, 16 Jan 2020 12:05:45 +0100
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: add SGI IP30 led support
Message-Id: <20200116120545.2f4a907b9ddda84e76e445e1@suse.de>
In-Reply-To: <b5bf7941-3fc1-641d-5482-509eeae34eac@ti.com>
References: <20200115130536.11453-1-tbogendoerfer@suse.de>
        <b5bf7941-3fc1-641d-5482-509eeae34eac@ti.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 15 Jan 2020 07:46:13 -0600
Dan Murphy <dmurphy@ti.com> wrote:

> Thomas
> 
> On 1/15/20 7:05 AM, Thomas Bogendoerfer wrote:
> > This patch implemenets a driver to support the front panel LEDs of
> > SGI Octane (IP30) workstations.
> 
> Thanks for the patch
> 
> Some nitpicks below
> 
> 
> > Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> > ---
> >   drivers/leds/Kconfig     | 11 ++++++
> >   drivers/leds/Makefile    |  1 +
> >   drivers/leds/leds-ip30.c | 82 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 94 insertions(+)
> >   create mode 100644 drivers/leds/leds-ip30.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 4b68520ac251..8ef0fe900928 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -836,6 +836,17 @@ config LEDS_LM36274
> >   	  Say Y to enable the LM36274 LED driver for TI LMU devices.
> >   	  This supports the LED device LM36274.
> >   
> > +config LEDS_IP30
> > +	tristate "LED support for SGI Octane machines"
> > +	depends on LEDS_CLASS
> > +	depends on SGI_MFD_IOC3
> What is the dependency on the MFD?

the gpio lines where the leds are connected are managed by the mfd ioc3 driver.
So without that driver this led driver will not be started.

> > +
> > +
> > +	if (num == 0) {
> > +		data->cdev.name = "ip30:white";
> This also needs a function as defined in dt-bindings/common.h
> > +		data->cdev.default_trigger = "default-on";
> 
> The name, color, function and trigger can be pulled from the DT or Firmware.
> 
> The firmware should contain a node for each LED to be configured.

SGI Octanes don't have DT and the firmware just toggles some of the leds,
but doesn't provide informations about it. That's why this is hardcoded
in the driver. The MFD driver detects the ioc3 chip and knows it's a
SGI Octane mainboard and creates the led platform device.

How is the correct way to this without DT ?

> 
> > +	} else {
> > +		data->cdev.name = "ip30:red";
> Same as above
> > +		data->cdev.default_trigger = "panic";
> > +		writel(0, data->reg);
> 
> Is the LED on by default?

Depends on the hardware state. If PROM firmware detects some hardware issues,
it turns on the red LED. Otherwise it's off.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 36809 (AG Nürnberg)
Geschäftsführer: Felix Imendörffer
