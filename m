Return-Path: <linux-leds+bounces-7438-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMVWIjGWwWkTUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7438-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:36:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 037812FC5DB
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D0CD30333CD
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7B73DCD97;
	Mon, 23 Mar 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gER+PnsK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F61A3C9444
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294542; cv=none; b=MYK2LbQpxSYelXzE0kjiZFv+/4FP14AXaCKZ16a3gk9qvwfvZ6KbFn4zCPLZucyao1ytiRohMQx2Cl21zq7sq0JlIzb3+k7/5t6ZexiWf2gQndafUIRXz0yWPAg80Q4PUSkyuVITIQd7lRM8SZc6AWvoYniNsR6GsNp7M2p4rVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294542; c=relaxed/simple;
	bh=kvZQfR6Ka8WnuKuT7mVazzZOQdLKZWJfub3aSBzO8AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCfR0fxgiKfN13MOxQiBeW3qE9iGp6FoigO2blEM8vadFIdDpLvRD8UY/TNfAcAH8FQVYphfO+gB/CUKk7JVsdDslKtO/txsJF77tHjQaFgGEeQZFtun6I6AZ3WPpVls8MXaHDbsjh9Eu7/0J8u9G/XWA4oF4arN9zSiw1iaQ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gER+PnsK; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4b77adso4712316c88.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774294535; x=1774899335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hsALcZ16tevmJ3ng05DYY6tY5JjgfE8hJRfdYF/sgZQ=;
        b=gER+PnsKerawqjr5zJOkKJ7vn7s58hrCHWcIoAhdjFt27DESMOLN3wTgXJhso3fpuw
         1oIvt7jwneWdajfhCwQDqxinICvxzdiLJJ/5pAuM8lzo8lJojssSseVj/Z+yYJb5ihRg
         inRz9ss6IPHd9r3dxgf4WL074mJb4Lm88olwtJtapzoFF22VtIJyuyr7hwvnGOHdnONy
         tEjrM6FVCh8Dtwy/P/cERijF+kdULjB1cPZoMXGhxXfatDide14gpc/ZqCDTHyxuym8S
         Z8C9QKkA8aT4bmERGg+MrjyS3lFoEcRuZG3AcARhSroaURJIFk3Gp4VEaPbydmm9/Djo
         tYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294535; x=1774899335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsALcZ16tevmJ3ng05DYY6tY5JjgfE8hJRfdYF/sgZQ=;
        b=KlF9FP2ZxWiCA6rKxOkG6Ktnm/5BuxjzVbwXV5stN2+FGPes+ocRCSI/nSezsp30Ou
         v+KFvhWgcyFPoVU8tDJ6VIC8bS5CzLnWdeAF49EgTTyWufyO0y78Tzpoh6HfeKPm9K8D
         W7/cAad4Sr8H9/8txKtY5xbG8dSQm5inMfIn2mzMbegMQB6dqFvN/xQiqpzmd2sPlelL
         zrPE6hkAcuaepIYUojJ+dEZEIfThESiwDXjsQt3dAE4gaI1VUpmp8cns/ynkBz6WPdj/
         bv4MCMZ5XZnsPgNICnug4iyB8XYoyWsjikW6Od8eJFemxlg8j5tT8rRsOqwqTqNipjcr
         pH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfYjIcv/LPGCQEx8FUDUp2f8VDAPe/+XzXajNJIfwCZwbdP785qPntYOhLw9ovWvUaGoyOcvRtO7eR@vger.kernel.org
X-Gm-Message-State: AOJu0YwmiQxY4BX6btbnx9xK5VRmcRHLaUZU11ioCjqipxe6MXYSX4PR
	t+uF+ExNQlnm+Dq2W71i/Pc+pIT69+qeBIWmXDaAYQvQJfROD4vB9YxZ
X-Gm-Gg: ATEYQzy2F0em7wybynS8KTGQ2ddzmyNQdtVp+IcbG+/DnbpgCXDbgVOPGRf73WoEKlS
	7CnVjTJ4LMAFwilNKG6ru9ahQPJ7tze5EaD+Hq1vQClRQj6KZ/fabeFh1EhWe9qxIZ7bm3VpKe7
	paseCcvFL+dtKk8BgRlmwUCDLaryq+96rbCWu9G/m4RUE7T8/t+CqMAXq3mrpwee0woXcc8g4KO
	uf9UkCbW0tBT/NVwATV+gPDHB+YoJy5AgoKCtc4mMOtHuH9H/lpxCOAV97rYd6G3ohvuCAF3+qd
	iOJ0v8flErt5nKfU88NID0DY6X7uLjNOgqH6dSOJVZiRgssMp1AwhAmGZGKaKWMZ5bXVHP14GXQ
	TA3DCZBCJD20ZcvZXeBgkOwxy2l6s3ka3REujvmfiOG0OjI6mS5OA1tSMBzBAjqdz89+2TG7DRE
	eR+4/O4+rv8nAR+NpdLFueFWXHMPZIr1JJRM91BaiZRoAG52ef4W0cyBXchCK24/Qy
X-Received: by 2002:a05:7022:6981:b0:12a:6ab7:3f9e with SMTP id a92af1059eb24-12a72671127mr5823640c88.10.1774294535335;
        Mon, 23 Mar 2026 12:35:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm12967046eec.11.2026.03.23.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:35:34 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:35:30 -0700
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
Message-ID: <acGTaZcF6GwkmC03@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7438-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 037812FC5DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 06:39:28PM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 11:33:36AM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 08:59:52AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Mar 22, 2026 at 10:17:15PM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > > > > > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > > > > > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > > > > > +					of_fwnode_handle(mdio_bus_np));
> > > > > 
> > > > > When you look at this, why is it better?
> > > > 
> > > > I think we should move as much as possible towards firmware-agnostic
> > > > APIs and use fwnode_handle instead of device_node or software_node or
> > > > ACPI companion. To discourage this I think we better remove
> > > > firmware-specific APIs where we have firmware-agnostic ones and
> > > > eventually clean up drivers that use OF- or ACPI-specific APIs.
> > > 
> > > Basically, no. This is wrong.
> > > 
> > > It may sound like a good goal, but there's an underlying issue. This
> > > goal assumes that the firmware description in OF and ACPI are
> > > indentical.
> > 
> > If they are different then drivers will make allowance for this, like
> > I2C core or SPI core does. But most of the modern drivers use
> > firmware-agnostic APIs (device_property_*()).
> 
> What is appropriate is up to the standards bodies responsible for
> the firmware. ACPI has a separate body, and we can't just dump
> the structure we use for networking into ACPI. So no, you can't
> just switch to firmware-agnostic APIs for networking.

So I believe there is a difference between deciding:

1. What schema is being used on a particular system - it may be
OF-compatible, or ACPI compatible one, and ACPI may support
OF-compatible schemes for certain subsystems or individual devices, and

2. What is the API to access the properties.

There is no harm to use device_property_read_*() universally as well as 
not having OF-specific APIs at the driver core level. What matters is
schema matches the system type.

> 
> For infrastructure where we lookup stuff by some kind of firmware
> node, I have no problem with converting that to fwnode APIs,
> because that doesn't transfer the DT description into other
> firmwares without prior agreement of the appropriate firmware
> standards bodies.
> 
> This is not "foreign territory" - ACPI in general doesn't want to
> describe e.g. the individual components of a network card, unlike
> DT.

I think we actually broadly agree? What you are arguing against is
saying that OF schema is guaranteed to work on ACPI systems and vice
versa, but I am not saying that (although for some things it may). But
still most OF schema can be handled by generic APIs (either
device_property_read_*() or fwnode ones).

Thanks.

-- 
Dmitry

