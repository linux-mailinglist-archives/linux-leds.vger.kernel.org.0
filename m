Return-Path: <linux-leds+bounces-7455-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNhIHBG9wWm/UwQAu9opvQ
	(envelope-from <linux-leds+bounces-7455-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:22:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A42FE31B
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0923E304A6D8
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD9E382385;
	Mon, 23 Mar 2026 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+SKwuKj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76B3822BF
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304459; cv=none; b=c4H4JT/CBumJIFrP8NxuIfrOXRjk28c5/6IHRXce9ji2uw/o1eKVZrAeI3iQ3NGFFm1AiI+dGZWOB2GE7+/HEMcpbD64gICVVvz2dMXKHiNjvkXesFRXEO0648gMA0AzmMUg0nw2z6Ulf+hlGXCORiiDllYcV2IivU6miX02q/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304459; c=relaxed/simple;
	bh=qqUgVu3iIB9dI3QgPpQ/I+hkv8Lf18eczVPIEmNZ104=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlLjoAbW61eV1MVfY674q6KmmiZzqgy0fggoNNv3NrhFW7mi//PTV1mZc5++yv524kBiES8mMyU+YylatGSBYlIhVvXHSupPgCpB1+rzJbLfEXf3XbKfWPNCCHzB69Uy4326wBlZ7xZF3PxCNo7vQeSv1agIznMDl+eCnDL1P5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+SKwuKj; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so3507193eec.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774304457; x=1774909257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kzF6SFWkNpwiVT7Tzq/JseNp5uopL7N2rNpwm2glC8=;
        b=G+SKwuKjoYWyLKf8QBIlUiunM/B9ly0uajRi5NpWg7loDqllf8SJ4LJ715Hhu4fpQj
         9pOTFA11serRiqEqRTFAJKW3yUed/hz0+ug/1BMf5gjEzTOT9XRtUywVQe9yEYFuKLrp
         fGY7t8I8clHj93m6jnZdSJxm8jviD2C+6z+gVqJ9VFZwGOUd5KPRAocXPM4bjvGuq/CA
         oaVukfDr5nWmw0YYLZwX01d1qL2DAjl7E6iAftQvBKhcqPREFhYZTDlSQVLGxkihs6Gj
         PUW0kEVTYB8kRHKOD9KCTjW9y+a1un5l/PygVk8Ek70i37H6PRlp50FBVTzI6yLiA9jf
         +cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304457; x=1774909257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kzF6SFWkNpwiVT7Tzq/JseNp5uopL7N2rNpwm2glC8=;
        b=iwLh12wVRv/W6P38Er9Ius47Pt/EjCuLUbSJrSxjtCQsj3nnHOtd0Qc2EeJ9hVM5O5
         B3BT0Gzm1ewc6UBjw+fsRtUJUd5T0AHD/BapTNKwlNHgQMpGOtm88ONDz7zHQKoXW9m7
         69BYpq4jM4ECOg0gP3wbrXMWjgUuatIN4X+7FhkUTPaLmwtTwCz3upPv21RemoHJdSKz
         4Z9IQS5w1VNBHWrLD4q36DukGDTC5enhJyaSDEv5kJJmY5VAl/SDhHC+c9ZUbPcgKxnj
         zMFRiNjzJxhYEe65FQjCBI7DANFFq3JhI8i37qDRMWZdSmC0+eDhkG2GcFT2ooDomlEC
         ILkw==
X-Forwarded-Encrypted: i=1; AJvYcCXtewnuthn8iJ1OcpMbigIN6B6K9H/XAXn/QY5EE2qmntmXrVmpHbhSGYbCfQlWGZbLqQSgTMtrdXHw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/SuibwXPDROVfUfzbnGjp5hKLP+bhW+b3xejYdAsoE9qSUbK
	s48MT0J+GTpFXg6J+46muxb4l5plNOfvdLHMhd4YLcTkqhMiOssb5gAw
X-Gm-Gg: ATEYQzw8Ml5V180Lm6MPVo7zmagdAv92SNEMejpoflSot3JYnb4GxdaS1WIMeJaGPIv
	B3CbtKP+yy3mcWQldudETM+XxJZ302g9bQ8QuDFYjr8gFbltdpQND4I4lEXxau2XEIXsC9rmYGF
	Bb+fslU5dg+/lUasQETGZt6aC3axQ4bg26bAYfw59/zEwIR1/kiikRDljIqjGJwW2McFeyG+Ae0
	g7W0jiccND5qg0sg+9N3urxnWPrbqTL84ZvGocur4wv3cWSPCQm8A2XcgtTJd53JNx63y7DSL5w
	KjcXpRiAZwTtbQK2ktSV0xtJmICHfq1BXjxjhML5acBEpYGO+/ph69oMuypS+3vgrri8VieLEVH
	z2XO7nUXpxKFTUH4iZNwYbBltUlQ/lQ8WHCNBk8+nYFTYvJjSxX+Nf4fVRymjkf+9hhs8Ui5uD5
	qetbh+Hb/WIkA/KlI4JHQT5N76w7T+pTg/0tEeWMxQhjvrbQtd4UKzgk5MbtcU/4SH
X-Received: by 2002:a05:693c:3b0b:b0:2be:ca4:e119 with SMTP id 5a478bee46e88-2c1097abc22mr6650334eec.30.1774304457110;
        Mon, 23 Mar 2026 15:20:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm16033079eec.24.2026.03.23.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:20:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:20:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acG4hY23zHHCRywx@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
 <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
 <acG1JNGVBJ2Mf7jC@google.com>
 <f3c51f5d-e001-4a6d-a219-f2e0698f35f9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c51f5d-e001-4a6d-a219-f2e0698f35f9@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7455-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[armlinux.org.uk,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E9A42FE31B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:00:05PM +0100, Andrew Lunn wrote:
> > BTW, why would not we want to push for the unified binding? They are the
> > same pieces of hardware...
> 
> I don't think the ACPI committee would be too happy if i ask them to
> throw away their standard and just use DT.

I meant if we are introducing a new to ACPI schema... Not throwing away
existing one.

> 
> ACPI and DT are different and we just have to accept it.
> 
> Nobody really cares about describing networking hardware in ACPI, so
> there is no need to support it. KISS and keep everything DT.

OK, but even for DT I think we should be using device_property_*() and
fwnode_handle.

If there is an ACPI support for mdio it is perfectly valid to use fwnode
handle on an ACPI system to locate an instance of mdio bus. And
hopefully the caller of this function does not really need to parse
properties itself but will use mdio APIs (mii_bus).

Thanks.

-- 
Dmitry

