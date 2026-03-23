Return-Path: <linux-leds+bounces-7452-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIqWIT+2wWlyUwQAu9opvQ
	(envelope-from <linux-leds+bounces-7452-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:53:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E91942FDF64
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 943EA3047530
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626063806DE;
	Mon, 23 Mar 2026 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ye/iSsS6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020AC37F734
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 21:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302603; cv=none; b=K2Lv75v0sLSLPHQt0sqRotonBVmwAihkIsWmrAsogrGit0i5bI6xuC5dKl6pMTLKLQiYWX1CqwSocx+FzeTo7JA3nZbqYcXqmF0gpY3DwRJvYdFKeyOhd87fb2ZHnIog0QSzCXBUfhpe9FjnuO/IPPnIpGJVlEROu6ZsvgMGuyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302603; c=relaxed/simple;
	bh=y+Gt1L0qys08x2UG0gqY30qV3m6tEiIOwvQdKXqzRZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rag4GA8cXD181NVtXUrD4MtuIG1RMffIvLVVn6T6EXhLHz1FuhKSbUXZ2lCO37DDnCmbn4keAG7DFS1CQ8tvR42aJs+MmUrWFFdFKwkKHt7u8r3NodG7X35DHpmIJZRSPHsd046cE6XhN5+FlC9DtP09viV/H+cMkzqm0Ex+kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ye/iSsS6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c107ef474fso1408723eec.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 14:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302601; x=1774907401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m0/AdxnnWyHs/Fd93ISLCpoYSuqRajs8ccdfR5letY=;
        b=Ye/iSsS6G/oVmcr4bmXbRRIwAuOp406pGIaJb7oZeVO4lOol2st7EqJYsGmqJ/rEl3
         8Bvops2VAZCCZ9itxieJIDdF4p1Qn8/hoWrfHhAFdQta9KYY//q1PbyQP/1Q+EkjQ+Oj
         ie3t697OsijWGD3l1ah2Sw7T8ubTxYZTEjmsUu0YrJbe9zuPMBwWB4x1ofRvtQ1FRqtE
         Bm4rFtw17MoowomGLKursWhmzzyEtsaeUcnk1apyeCoztGfsxmnH67avx6EZ3mye9Qq8
         pQgjm5DUDWwuXSx+jT2mcQhzZUPrztVdywYvr2zWLv7HGQGHC3Y/my5CsySlwFqyEiRV
         a03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302601; x=1774907401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m0/AdxnnWyHs/Fd93ISLCpoYSuqRajs8ccdfR5letY=;
        b=VbCg/sKbpB9jbjS4r8MSxxlA1H71n3AT8deslzLw5jSzT77JK6PidYAdkIlHEHvl1S
         WMNCK+jOC6m+gYbQu6sVg3Ac5Nm8VsLnugwhBJSQHuM5Pa60P1I6VWjRFkG1ssE5F8n0
         bHLIgOtn5t5QrGyabJGVjcqsUrrvtGR2VQ/kyk4Zhy+G7y5g0dQY0ZAbjPx7eXua2quY
         5BfbTG0x3CCa1K2w3Rz+Dh6mDojNpx9YuwYgPRHb0v3cu3dhOlMglRk1wZUJ7fYdQiv2
         DutiF402G/ojvyYEf1I/KoFAGVj+oZsh4Ga46ydyNlV16Ri9Rix9HzUH5gmlxIS8UK6C
         /UAA==
X-Forwarded-Encrypted: i=1; AJvYcCVvYM1Ng5AVYixX99FgVVxkevdRzA4BxcEhy4UD3KKUDHIjfTyYQU36JbleenufcXCala010FtH4llA@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCW6izDIQ56EDe0eHbujS+XYVVzeT+PEldxYxLLU1B+QnE9Jm
	HJeAOwuy7SypJ2JfNcKZKccfbvg1XpiikXvbojiLDzLt2J01HNhfbbRa
X-Gm-Gg: ATEYQzxQI2ffxbKS9fAuPPmv2hbHSMhQUkcbLmS2Cf31Q+PtqZststtJ6NtPu1LWA9P
	n7o2o4dh9BqwvaiGZdfmU+MQz1MB4KMt0emMPbuDdeVUxLKSTNU/Sp8jjjCnPbKxvPmFH0xk+4n
	B/qk5KlSEZJrKc5aPZ9AQUjjvO+Jk1sfwUm0TtTAHb5CATXVxK7zWcNefzcFn6yNnCDZr4AVmAr
	bT/SfKzzMWc/WAFbGUQ2CiDhm8HYFTwE+FUFyXw6K+RcEiQGcppxkJyJaw+M+is1JWkpjRyJVZD
	yKVTDLV1r87gZgcjxg9Ab5e31SKuCjt+YT3febrbrsxBz3edFcsYrdZuZ+HoP+3he+b4z1SkI4u
	KVLYy/ds7ZFFZ9cMZNeQk8OEVi0x5KaWC0rMctlldFaCjOUqbhOPKf9d5EkFEIUlrxAINQJFsZE
	avXng+4EsbSGv/dJft1qqkBODlVpxioltPc3ldjNGZhQCvz7wibqMwGLGIIFlnTRiU
X-Received: by 2002:a05:7300:72c7:b0:2b7:1e86:3604 with SMTP id 5a478bee46e88-2c1095e6a9fmr7621666eec.6.1774302601091;
        Mon, 23 Mar 2026 14:50:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31ebd5sm13412438eec.27.2026.03.23.14.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:50:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:49:56 -0700
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
Message-ID: <acG1JNGVBJ2Mf7jC@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
 <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7452-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: E91942FDF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:15:11PM +0100, Andrew Lunn wrote:
> > This is not "foreign territory" - ACPI in general doesn't want to
> > describe e.g. the individual components of a network card, unlike
> > DT.
> 
> It has also been suggested that the MDIO bus should be added to the
> ACPI specification as a first class bus, similar to I2C, SPI,
> etc. This would make it different to the DT. So we don't want to
> encourage developers to use the networking DT concepts in ACPI, it
> will just cause problems if the ACPI spec every actually covers the
> use cases of networking.

BTW, why would not we want to push for the unified binding? They are the
same pieces of hardware...

-- 
Dmitry

