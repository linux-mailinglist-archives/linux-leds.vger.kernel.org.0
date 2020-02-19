Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DD316449F
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 13:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgBSMtI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 07:49:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39937 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgBSMtH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 07:49:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id c23so17347623lfi.7;
        Wed, 19 Feb 2020 04:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c4IZGpTAiNI/MqpzST2+IXgvoSC5bM5KD7bSza2xjkg=;
        b=NAICxQe2DIF/hLG5UTYxHPxbC+XLDC4ccO4b+4UZ5aY58C/SnY3tYe/oSHMxgdv/CU
         s69En5N61+WCGdSL9YrcIBsMHoMBJB4Q/THE7jd9JARwgsYXvUXA/TRmQqEvh5n5/j4Y
         5IJdHI2/rgNghRyMvSrlrhOU2U97jlknXvaoYlwgJbP1tCqgzUYlT1T6avrboFZpiWJW
         qq0C7k12iiI8X1AKSfigmXd5Y/i10B9lw8c3uEw1ufHhLsC2ZVzNlJnQWuQUc3oaeMEj
         Pmlv0CfcDeUOXLpaSC9UzoVMKJh5BLYt35SgjoPciS3GcXyTWK1aaLt8puRPmILmg3PR
         L7PQ==
X-Gm-Message-State: APjAAAXUwW1FxSW7abEzkdhEqwyP79WRcTuHwZmQ9zLHl12xXERulYLi
        LXBRLkFmpQD5ThMbt05tgnw=
X-Google-Smtp-Source: APXvYqx7jMm3SXNV5f1xhHX5oxfd9Wq+q/tT0PPzUs29Vkrs1MRxvQ83Ykbc8URnUGMar9i54Q/j0w==
X-Received: by 2002:a19:f519:: with SMTP id j25mr13281499lfb.41.1582116544565;
        Wed, 19 Feb 2020 04:49:04 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id o188sm1235568lfa.50.2020.02.19.04.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:49:03 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j4Omh-00021O-RY; Wed, 19 Feb 2020 13:48:59 +0100
Date:   Wed, 19 Feb 2020 13:48:59 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 4/4] leds: trigger: implement a tty trigger
Message-ID: <20200219124859.GC32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-5-uwe@kleine-koenig.org>
 <20200219105239.GA32540@localhost>
 <20200219110306.k5jndutalll64esu@pengutronix.de>
 <20200219111913.GB32540@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219111913.GB32540@localhost>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 12:19:13PM +0100, Johan Hovold wrote:
> On Wed, Feb 19, 2020 at 12:03:06PM +0100, Uwe Kleine-König wrote:
> > On Wed, Feb 19, 2020 at 11:52:39AM +0100, Johan Hovold wrote:

> > If I understand correctly calling tty_kopen_shared() doesn't open the
> > device, just keep it referenced which prevents it to disappear. Unless I
> > miss something it doesn't result in the tty's .open() being called.
> 
> So tty_kopen_shared() is something you added. Judging from a quick look
> it seems you can only attach a trigger to an already open port, but the
> trigger will then keep the port open (again, consider modem control,
> power).

Sorry, my bad; this reference shouldn't prevent the port from being
closed.

The fact that you need the port to be open before you can attach a
trigger does sound like a problem though (e.g. consider udev rules).

Johan
