Return-Path: <linux-leds+bounces-7435-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P1RDFSQwWnFTwQAu9opvQ
	(envelope-from <linux-leds+bounces-7435-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:11:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BE2FBF99
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240883343B6F
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 18:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546802DB7BD;
	Mon, 23 Mar 2026 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIw+qtLG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C12D94BA
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290823; cv=none; b=DpK+LGa+pMiyXU6J1uMJxFuFN9j9YS967xp6VUPvAHLdiJ7fFoi9z7z84NdLVMIs4UGj++rRPcg/oFALhbOIq36fY4AVHNpKasSIhcsgCMJOv9aj7kjp+pX/ImKko3vfuI31HDddq2EVlW3rjusPDBC7m5Unxq239MAMAlY0ltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290823; c=relaxed/simple;
	bh=6I3TCajsnbPhvopolFVK3KO9pDXc1m1XrVrTJSIDMJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0cgJQvf4tHniACjE1NBr12Gan6asOQI4undIAaBhU3393ItA4ErALk9bmOXwBZxKHs1blF7lpVzWeGkxwf0mkHQXWWVH8HfABc9X7re+RIc5EpTYW4Tf6rhShO9x7v0sDeNh30qPyI1j97LqSNq8CTcgnJWmgpZxDSJ332L27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIw+qtLG; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271257ae53so538759c88.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774290821; x=1774895621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnYjc2faOHjkbaG+X0+KOSaQNDxXMdAftkLY6+CZb5k=;
        b=tIw+qtLG94A2vyctJ1nrIkpgQyY6GdyXSxudWeaEhia18nDKP7H2BlmAo+bzO1ezIi
         SZroA2JPns9tsiLeMtLDEP0iBAiDMhPuwY94Ch9vwu5Nb7kzxQKSjlDb4Uno3JOQoPva
         3p2OdOAudQkBOZaHWSaWAPNRZn/OsnD3dJKCN14jNHAD4DaXu3hF0f2dE6vn9ewGTpKy
         D711seWX5f00wu6/sVlnQL1F3p+/WbV/GJbZo+cZEXwy8JMK+t8PCfvRA9LLH51zU9st
         LzGjDoaxrG7NJQ86D9iUasPVzjiFa5zJR7vWcUGVKZIzLnsmNHxMwJgLz8UkPqUu8jAo
         9G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290821; x=1774895621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnYjc2faOHjkbaG+X0+KOSaQNDxXMdAftkLY6+CZb5k=;
        b=Tq/2MO0qycOii7FQpcZnCX+Lmi0cWNOtQHHxLHAbAmXdRY2Vrh4E0ILj9qdEQ0mNkz
         /q/KxRzhoTBbZFmShdVDpICXpUebXTqKwY/MeaixkG9AJcvjp39B2M/Hegpee8VsPR15
         gkvFjgbMIKlvnGLXHLjCnu5WuW3SugDf3HisI42ba08jIyYN6cx80G/CA+uUaAOM8xbG
         tgbUqldOorzZFRXFlho+HwCq8/NY+lbsxVsdnpLQu+++BqSiCx/sQgclP6vc7iZp9RsH
         dXT3MU5SDTQqXr2poH0kq80B4ZFXKqwf9RXZt25O2jkf/7tdEPG8CgrBY87CTmhSphQI
         /MTg==
X-Forwarded-Encrypted: i=1; AJvYcCUKKQRWLfeEtxXIMhRksg0V0TzGKlEsIhz2le5sVjzdN+2fmVJ5ooLmt3d8jLIzaXe13Y7sIZvWNt5A@vger.kernel.org
X-Gm-Message-State: AOJu0YyW02e8U2FTDCFBDfWzUmfXbzK+Siz1eGL8F2xwzibZ6IlXb7pj
	cGXz6viZLMzvvEohvciVQsaez15QKomhHtsKBaRVPB6AtEnpEPty+w/g
X-Gm-Gg: ATEYQzwTd5n05CRG+dUSnp+pv3hZpx3DX0k1HJgAhqwRjkvBfLRYJPhkL6kElc17+LI
	po92SeJow16hsH6/EGCjPnb9MNPA6lXVg1VIPSognNYgYoug14pNDUUU1zt6vtRw8npcDusjVN2
	rtlo8F5tXvLlk8cgLieWuhv94qfPlJGXG9+RKbXWpjUPMTGEh+r6skXnug9YRNFCIWK/wJVuzDK
	/uwx5/sL/8x3ch9I7Ywpc+ISoV2W9t0yvAGPUm2TV++NtpTVyz7KdFfHnYrmEaaf5vMTHrZqaIx
	GtsfDi5oYu1C052HtI6AWPunaNddB9Vq8WOWsFbS+XIO6SB7Cjarq7wJBdeSY191uV6jbIjVsuo
	UkIwhLomIEy++4lB5SADPHNVzt4+KEQM816C98SLwOrVBGF2ffkGExdM2754ZK9/a5EknskG1RS
	T2QNBLhcRhXpZtuXFgcWsWtz55y15k2dgQx7L13ivyFJ99v7/j20lRnJ9riyN8rvdL
X-Received: by 2002:a05:7022:4199:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-12a72671ad6mr6133919c88.7.1774290821078;
        Mon, 23 Mar 2026 11:33:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm9391030c88.4.2026.03.23.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:33:40 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:33:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
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
Message-ID: <acGGWTmSMuc5h3Od@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7435-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
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
X-Rspamd-Queue-Id: CF5BE2FBF99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 08:59:52AM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 22, 2026 at 10:17:15PM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > > > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > > > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > > > +					of_fwnode_handle(mdio_bus_np));
> > > 
> > > When you look at this, why is it better?
> > 
> > I think we should move as much as possible towards firmware-agnostic
> > APIs and use fwnode_handle instead of device_node or software_node or
> > ACPI companion. To discourage this I think we better remove
> > firmware-specific APIs where we have firmware-agnostic ones and
> > eventually clean up drivers that use OF- or ACPI-specific APIs.
> 
> Basically, no. This is wrong.
> 
> It may sound like a good goal, but there's an underlying issue. This
> goal assumes that the firmware description in OF and ACPI are
> indentical.

If they are different then drivers will make allowance for this, like
I2C core or SPI core does. But most of the modern drivers use
firmware-agnostic APIs (device_property_*()).

ACPI has allowance for device tree properties (via PRP0001 HID
entries), and drivers should work with them.

> 
> Sure, looking up devices by fwnode handle makes sense, but looking up
> anything that is described in firmware is not suitable for this kind
> of conversion, because in doing so, you effectively "port" the DT
> bindings to ACPI, and it may not be suitable for ACPI.
> 
> So, please don't make wholesale changes that transfer the DT bindings
> into ACPI.
> 

I am not "transferring" anything, but I want to make sure the code works
even if we augment OF with software nodes or if DT properties are used
in ACPI.

Thanks.

-- 
Dmitry

