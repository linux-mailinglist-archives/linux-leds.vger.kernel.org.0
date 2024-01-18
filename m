Return-Path: <linux-leds+bounces-616-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D9831BB4
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jan 2024 15:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A711C2096E
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jan 2024 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1ED1DA2C;
	Thu, 18 Jan 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXuVe8xy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E61DA2B
	for <linux-leds@vger.kernel.org>; Thu, 18 Jan 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705589229; cv=none; b=LU1oKRGQ6kpi3sUEn6lkGCjfEtMGRef6A2UBHeJZnSdXAos2lPHEUNg/4XBFwRF86u2zBT2GXkgDP3SD2qU7W/S6AuxOwQjrK38u28iiizfA46WkAokDNuMpAWdpXxC/Xv8tcX6lE28aW10jF4ylajisDPzRUdJng4Hg8BMGMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705589229; c=relaxed/simple;
	bh=8OD4MKvVeTV+5FyzRB+G/MPn+5mY/FWD1qXAPTfWbNc=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=L0tcLir/CXYrIGNDnkAr9p8TLmH1h+7guHj5qAlcwel6x/LSNiQqkARtk9nE/QUEgNH/nGbj1USskF4WOh8t3rh5kr1YpnJkbWZ5/MQ7VWot5mHWy9X2h+Xwkzrs+RAGChyZ4CHV8n7RLZ76EkP2aoTiClIUycKQjw/qlYvIdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXuVe8xy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C62CC433F1;
	Thu, 18 Jan 2024 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705589229;
	bh=8OD4MKvVeTV+5FyzRB+G/MPn+5mY/FWD1qXAPTfWbNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXuVe8xyqO+M7u3d6MQ4jQCQlgcCxtMcQzRpPVnpHzNonREaWxfQHTUnTbfh1j/kn
	 sVxkiwvAFNkFT/bP24qJGtbfi3jCA3c6sx7+jR5BW5a7Ee86tGWGiyUt0ePNnMNKKr
	 wsQVuT10LEf/NFGnkBeTS4Ta8yAJVGWq5h/P19gqJtunemxjdUJH1JYlElEyCE3r6d
	 +eXd2k2QTceMRU/0VULsoL+Iy+Bl499yC4FYCStnLxHukNzEqAGcojRPxzVtcePacu
	 oX9MkoZCnkSIwkLP+w4WEE3NZMivaxlg5OOJIQmxMGaOnWHP0RHVAqh//qEA2swHOJ
	 GBPc9KbRy636g==
Date: Thu, 18 Jan 2024 14:47:04 +0000
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: panic: simplify led_trigger_set_panic
Message-ID: <20240118144704.GB3305748@google.com>
References: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
 <3067e362-eee3-f338-9b64-49a33547bd3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3067e362-eee3-f338-9b64-49a33547bd3b@gmail.com>

On Tue, 16 Jan 2024, Jacek Anaszewski wrote:

> On 12/9/23 23:54, Heiner Kallweit wrote:
> > I don't see why we iterate over all triggers to find the panic trigger.
> > We *are* the panic trigger. Therefore we also know that the panic
> > trigger doesn't have an activate() hook. So we can simplify the code
> > significantly.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >   drivers/leds/trigger/ledtrig-panic.c | 23 +++++++----------------
> >   1 file changed, 7 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
> > index 72297a845..c646a3cbc 100644
> > --- a/drivers/leds/trigger/ledtrig-panic.c
> > +++ b/drivers/leds/trigger/ledtrig-panic.c
> > @@ -21,24 +21,15 @@ static struct led_trigger *trigger;
> >    */
> >   static void led_trigger_set_panic(struct led_classdev *led_cdev)
> >   {
> > -	struct led_trigger *trig;
> > +	if (led_cdev->trigger)
> > +		list_del(&led_cdev->trig_list);
> > +	list_add_tail(&led_cdev->trig_list, &trigger->led_cdevs);
> > -	list_for_each_entry(trig, &trigger_list, next_trig) {
> > -		if (strcmp("panic", trig->name))
> > -			continue;
> > -		if (led_cdev->trigger)
> > -			list_del(&led_cdev->trig_list);
> > -		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
> > +	/* Avoid the delayed blink path */
> > +	led_cdev->blink_delay_on = 0;
> > +	led_cdev->blink_delay_off = 0;
> > -		/* Avoid the delayed blink path */
> > -		led_cdev->blink_delay_on = 0;
> > -		led_cdev->blink_delay_off = 0;
> > -
> > -		led_cdev->trigger = trig;
> > -		if (trig->activate)
> > -			trig->activate(led_cdev);
> > -		break;
> > -	}
> > +	led_cdev->trigger = trigger;
> >   }
> >   static int led_trigger_panic_notifier(struct notifier_block *nb,
> 
> Looks good to me.
> 
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thanks Jacek.  Always helpful.

-- 
Lee Jones [李琼斯]

