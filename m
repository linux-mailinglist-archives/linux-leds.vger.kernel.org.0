Return-Path: <linux-leds+bounces-7434-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB9oFJWOwWlxTwQAu9opvQ
	(envelope-from <linux-leds+bounces-7434-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:03:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A51422FBCD9
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18630313152E
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0E53D1701;
	Mon, 23 Mar 2026 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU4LxGOf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6A23CF67F
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290518; cv=none; b=RKsaecxtQJ2XNPXkdgZ5p1waY1BGQDAJ5Pjdx3pusM9uOouioAVJQdS56Q1kXRtdM0/zi8xaE/t1Q8OC5rMlxMSCKGAPMRf+ywS34p10ijN9a7TQs7DLdte9hiTYMBUzr4o/BMpRdt0pAXDchpTX2z2T+7miBowBb30+WTrfZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290518; c=relaxed/simple;
	bh=t8uGoOmn69GTvslBxUEc5eTMB7ZiO+nrKn47M9Cp8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2SKtkwBaFEUrr8PfrChAoxtDnVOuSEWD9Bc9hBwalPFC8Jt0Xv7SXTX8VreqwswfJ3rsktE8oIrATZBtTz+89gaagNl3OmreIj1iC7KR3ZB8b+3KLEl511lrk/9IpUZy1TyItYrhlAXiQpsBe6mRr1KbDCJELxjW2Lh2Ty6ZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU4LxGOf; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so3065597eec.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774290512; x=1774895312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDXVXDlTyWriMoHabs2g4jaDjhygWMksayJaNvHtSE8=;
        b=nU4LxGOfPs3QZ3q1BOHY3xW1BsasEVECfsn054gvduGccyJOdGSSriZyQel7ZZuODl
         ND8rPtQjMEovixdtNdNPwz4OydDcycp5pWW/3m1fgC5jMQKNUFPH7NGtKsQK1IfKfrh9
         Rqidd+o/bKJ8/7fAi7cuedl4la/kRsdBnWlhvXPhFzz0J2hgto+9uB1E+I8bK+rQylJi
         lSKxKrIbr7b/Jb/WJJy2Mj5pzoj2OD079F/dp9rrMqkSgsYnMnG4IjOOa44gvtMGJhqv
         B9oDuQ493ayNmc/UX1pJrrIqdmYW1NQWAO9Q0QIVybo3KKDYoESuZZMQdAQSGs8k+uO7
         teDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290512; x=1774895312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDXVXDlTyWriMoHabs2g4jaDjhygWMksayJaNvHtSE8=;
        b=jZGl61d1k6DF5deO3m1pEORlX0OP/uYkoisHYM7UlI4CQQnKbLrHx5iAYmx1BTsdRQ
         ByCRGWIYyENjrvvgp6bYrj5npqRT3ks0ivUB7e8KCFhM93Dxlf3SJY6iSMtbSlVNUQw6
         0xaR0htZt79ldaJGcN7bmK5etnzjNkaj8thy99qbfUj1CLtptBPx5o/QvZNUl4R2W5JC
         HoD6J8INWVixXGbRS5FHjNo/SU5AdnWGTxlxD5xYP9Ebra8XbLnVGsEj5V33NLrOnf7S
         9f2hit3+meNmjAt45sO0s72YeVskgXOW1W23DiZMkLMm4LfjDHTgGt2najAaLnod+CUO
         JCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuh+1GycbmD5V58uKFOR7qwsY61a433q8T2tcD+Sp/cAkcopeWN+5XfGcfbsXkCvKHoCqzVbWIAB16@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTF4YjwGGBvpEk9mAySF7E1VsJXjgXa+costCMlkYTtjvfcF7
	kwiy5sR41Y6IyEVsa8irTF1zOXIQRyQW5F349c4kzXzKdSbDJeT76NWs
X-Gm-Gg: ATEYQzzIeZlMxbVn9Ah35tiWLHBLH8ER+6WmEjjL7n0OZnNUP8fg6Sitt7fEnyBecVs
	ZWvJfIBDgIqZ7IP6VPX2bMkQ+jhcP6y0Aq3wNavv5Z7q+T0OqTIAEto0+rZoFHDxed/6fuEKUQq
	C1Pq3/h6ZoILriUjcHrrZeJnJipCIVCBHMQYCNHI23AYuZgFU2zgWltHrBV+qioRF4G2lK1B58X
	LYzdBbRXDsnZZE0WlnA7k0TF6dCaZehK4WaNdR1kg7nMG/5hYqZpOD8QBYk5z+o7kiEAGkmefuq
	ZefvCL4gHYfzkH0I24KhcG3klpx4QGg9xCnDUER32xe7LQlFF5MCgkh4QBBVULggnNKupGhZAYM
	/uDqX13jk0xxq3K4RQKtJMNyhVm0Sy34obvAI9YdcVrvBAOTJ1lywbNuUiKDz/SmVbzEG38f/G3
	suL7+XJKEpa2k8Br3l2plL9GPlFvGgFoY27k12d1N11Y+xUOrHuznmVpdF9zsEuY3m
X-Received: by 2002:a05:693c:2b06:b0:2c0:ad52:e657 with SMTP id 5a478bee46e88-2c109712cedmr6434030eec.21.1774290511733;
        Mon, 23 Mar 2026 11:28:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm17872306eec.9.2026.03.23.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:28:31 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:28:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGFksyx3SA0kJ5b@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7434-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A51422FBCD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:
> On Sun, Mar 22, 2026 at 06:54:22PM -0700, Dmitry Torokhov wrote:
> > In preparation to class_find_device_by_of_node() going away switch to
> > using class_find_device_by_fwnode().
> 
> >  	struct device *dev;
> >  
> > -	dev = class_find_device_by_of_node(&regulator_class, np);
> > +	dev = class_find_device_by_fwnode(&regulator_class, of_fwnode_handle(np));
> 
> The regulator API is very deliberately specifically using the OF APIs,
> not the ACPI APIs, since ACPI really doesn't want to model regulators.

For now? We also have software nodes and maybe we come up with something
else in the future...

I think we should use firmware-agnostic APIs as much as possible, and
only use OF- or ACPI-specific ones when there is no generic equivalent.
This makes the code most flexible.

Anyway, I am not proposing to change all of the regulator code, just
clean up driver core APIs.

Thanks.

-- 
Dmitry

