Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E0119FED3
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 22:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDFUMR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 16:12:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37808 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFUMR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 16:12:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 80B8D1C47B2; Mon,  6 Apr 2020 22:12:15 +0200 (CEST)
Date:   Mon, 6 Apr 2020 22:12:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: ariel: Add driver for status LEDs on Dell Wyse
 3020
Message-ID: <20200406201213.GB18036@bug>
References: <20200322074134.79237-1-lkundrak@v3.sk>
 <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> >+enum ec_index {
> >+	EC_BLUE_LED	= 0x01,
> >+	EC_AMBER_LED	= 0x02,
> 
> Defining the value after the 0x0 is unnecessary as enums are incremental
> only the first value needs to be defined if the following values are in
> numerical order
> 
> Can these also be #defined instead of an enum??? Not requesting them to be
> just wondering about the design decision here.

enum is okay here.

> >+	EC_GREEN_LED	= 0x03,
> >+};
> >+
> >+enum {
> >+	EC_LED_OFF	= 0x00,
> >+	EC_LED_STILL	= 0x01,
> Same comment as above
> >+	EC_LED_FADE	= 0x02,
> >+	EC_LED_BLINK	= 0x03,
> >+};

If the values are shared with hardware (and they are), making them explicit is right thing 
to do.

> >+#define NLEDS 3
> 
> This define needs to be more unique.

Why?

> Something like EC_NLEDS or EC_NUM_LEDS and should be moved to the top of the file under 
> the #includes

I'd do it that way, but I would not request new patch version just for that.

Best regards,

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
