Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E741171F47
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 15:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731273AbgB0Odp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 27 Feb 2020 09:33:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:54244 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732522AbgB0OAG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 27 Feb 2020 09:00:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0F330AD21;
        Thu, 27 Feb 2020 14:00:05 +0000 (UTC)
Date:   Thu, 27 Feb 2020 15:00:04 +0100
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v5] leds: add SGI IP30 led support
Message-Id: <20200227150004.97154811ecbd2f5ccc22fa64@suse.de>
In-Reply-To: <20200226140058.GH4080@duo.ucw.cz>
References: <20200224111733.10320-1-tbogendoerfer@suse.de>
        <20200226140058.GH4080@duo.ucw.cz>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 26 Feb 2020 15:00:58 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> > +	switch (num) {
> > +	case IP30_LED_SYSTEM:
> > +		data->cdev.name = "white:system";
> > +		break;
> > +	case IP30_LED_FAULT:
> > +		data->cdev.name = "red:fault";
> > +		break;
> 
> If the white LED normally serves as power indicator for the system, we
> might want to specify that. Does it?

it could be seen as such, but it will be turned on only after POST has finished
successfull. So it's off if POST failed, which doesn't make it a real power led
IMHO.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 36809 (AG Nürnberg)
Geschäftsführer: Felix Imendörffer
