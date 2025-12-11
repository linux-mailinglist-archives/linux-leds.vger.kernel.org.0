Return-Path: <linux-leds+bounces-6405-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F8CB5E76
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 13:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65063004BBD
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 12:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6345C30FF37;
	Thu, 11 Dec 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="uA5ANRP0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3330FC3E;
	Thu, 11 Dec 2025 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456810; cv=none; b=YgddostySChPE3+WzhNE0BmbSFI64kKlHBNxT78dWuWWu9p9VEwF/dJy9qGJGASKFlG2FC8p3gucG/K5iPhz5CtcLKGY+C9aAFcu+q9ayT4AGJJce5PxoNoDlTebGJRzy30LJd6XsbBLvxk1GTsRef1gBCsF/SsKLUApB/JIwuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456810; c=relaxed/simple;
	bh=HbMYnfZwKQ7D3JdLg1XsC1SZaVovCrUDLaFO8oHdqLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5sibQOEwreW+fndYa3uvPEqznmaPMWIzLh6nPZBNS/DPgQVJFZ/vLmqfzU461DS6y9MtQrjYvB/St3PqMflc38d1YKiQYHqFOWkxtJmf8971nOHEKG+1ATuj+jZAHf12ZMOr2OEPhwhQk09zeyv58NqREdtJEBXOPdcg9sh/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=uA5ANRP0; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F0131485A6F;
	Thu, 11 Dec 2025 13:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1765456459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qKfbaUhISYe4+sLy4xRY0p6VWzsBTN2op+PzDlYCHIE=;
	b=uA5ANRP0wquy+rAf8OS3D+S5fbjL/Vrq9qLdJtYVH03+ve4AJFwk/um6hmFE02/url3xY/
	+XSJcDNPdlIIBJ8rCrIqnryM6oiDtH/HiBoHDvyq8ofLnTf3NmBrifN5MfiWsmYrR23y2T
	NHLytAM7sKMuWArcudnsl99NBwm6WNP2hoJskdPIC7EGo4iD6cw46uPisZuQrd3PUE6J+f
	xtjS//1IRmKP2tlBY/f74JE+jT4fqM8rnF0/Dz/yo6ldi05EHRFuysZrICvBoZPUAHVLjS
	m/TtWL3J5EhX6Oym6B9ttSzAJaF4YdfL7hr8aCMOrFg+Znah2UE+qQRdowPayQ==
Date: Thu, 11 Dec 2025 13:34:10 +0100
From: Alexander Dahl <ada@thorsis.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>,
	"lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Message-ID: <20251211-plural-generic-c7e78cd51f9d@thorsis.com>
Mail-Followup-To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <J.Brophy@corkillsystems.co.nz>,
	"lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Andy,

Am Wed, Dec 10, 2025 at 11:54:19PM +0200 schrieb andriy.shevchenko@linux.intel.com:
> On Wed, Dec 10, 2025 at 06:30:06PM +0000, Jonathan Brophy wrote:
> > > Can you elaborate? I think your downstream code (I have no other ideas where you Q came from)
> > > uses some outdated approaches. Try to look at the problem from the level of the existing APIs and 
> > > frameworks. We shouldn't really have such an issue (but it might be some special use case, I admit).
> > 
> > I'm trying to create a virtual led driver but with the removal of
> > of_led_get() im struggling to find a way to make it work.
> 
> Still it's unclear to me what it means and how the code look like.
> Perhaps you need to send some patches for the discussion (maybe as
> RFC if you think they are not upstream ready).

I guess it is about the patch series Jonathan already sent?

https://lore.kernel.org/linux-leds/20251019092331.49531-1-professorjonny98@gmail.com/T/#u

Greets
Alex

> 
> > I investigated alternative approaches to avoid of_led_get() dependency, including:
> > 
> > Direct class_find_device(led_class, ...) calls - Failed because led_class is
> > not exported (static in led-class.c)
> 
> > bus_find_device_by_fwnode() - Failed because LED devices are class devices,
> > not bus devices
> 
> > Manual iteration via class_dev_iter_init() - Failed because I cannot obtain
> > the led_class pointer
> > 
> > of_led_get() appears to be the only viable solution because:
> > 
> > It's the only exported function with access to the non-exported leds_class
> > It handles GPIO LED matching quirks (parent node vs child node)
> > It provides proper reference counting via led_put()
> > 
> > Should led_class be exported, or is there a planned fwnode-based alternative
> > to of_led_get?
> 
> You can introduce it as a precursor to your driver. But OF centric variant
> gone for good, we use fwnode in a new code.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

