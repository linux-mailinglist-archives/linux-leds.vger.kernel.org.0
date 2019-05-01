Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019B110388
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 02:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbfEAAl4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 20:41:56 -0400
Received: from mail.nic.cz ([217.31.204.67]:40997 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfEAAl4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 30 Apr 2019 20:41:56 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id 1E9D1632C9;
        Wed,  1 May 2019 02:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556671314; bh=Nkawm0KEuZfN5h0piClklPBjQSZrsu8awGHf3+VBEMM=;
        h=Date:From:To;
        b=qmjoHGqGLEEgOWgLFrCRSbd9H6nWC17cCmB30KTivBrDdwN2sxUylSbXZIIPz+vMj
         cRInBLN7cK2PnppG+1Q5GQmuBClYstEAeVAyipI2QqEEcD7HBRkWH6QO0bPZQzHU+Y
         8q2KXJB3hjsWG+hf1kOGgWPRmNIGBtxYtvyY/qvU=
Date:   Wed, 1 May 2019 02:41:53 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support
 for 256 brightness values
Message-ID: <20190501024153.643f86f9@nic.cz>
In-Reply-To: <20190430230215.GF20410@amd>
References: <20190429212944.15643-1-marek.behun@nic.cz>
        <20190429212944.15643-3-marek.behun@nic.cz>
        <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com>
        <20190430230215.GF20410@amd>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 1 May 2019 01:02:15 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > >@@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *client,
> > >  static int omnia_leds_remove(struct i2c_client *client)
> > >  {
> > >+	u8 buf[5];
> > >+
> > >  	/* put all LEDs into default (HW triggered) mode */
> > >  	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> > >  				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
> > >+	/* set all LEDs color to [255, 255, 255] */
> > >+	buf[0] = CMD_LED_COLOR;
> > >+	buf[1] = OMNIA_BOARD_LEDS;
> > >+	buf[2] = buf[3] = buf[4] = 255;
> > >+
> > >+	i2c_master_send(client, buf, 5);
> > >+
> > >  	return 0;
> > >  }  
> > 
> > I wonder if we're doing right merging this driver in this form.
> > We break the rule one-led-class-device-per-one-channel.
> > We don't have LED multi color support yet, so this should support
> > RGB LEDs in the old manner. Or switch to using LED multi color
> >  class.  
> 
> Fair point.
> 
> We treat it as a white LED instead of RGB LED at this
> point. One-led-per-channel would be problematic, as hardware
> "triggers" are common for all three channels.
> 
> So I thought we could go from "white" led to multicolor, when it
> becomes available, without going through One-led-per-channel...
> 
> I agree this is not quite standard.
> 
> 									Pavel

Hi,
I am aware of this issue. I plan to change the driver to multicolor led
class as soon as it is available. But from the discussions I have read
it does not seem it will be available in the next kernel release. I
would like at least full brigthness for the next release and maybe hw
triggering, for which the first version I plan to send this week...

Marek
