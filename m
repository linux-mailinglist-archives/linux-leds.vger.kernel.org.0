Return-Path: <linux-leds+bounces-7424-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOWOKvnMwGkgLQQAu9opvQ
	(envelope-from <linux-leds+bounces-7424-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 06:17:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121922EC9B1
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 06:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB178300BDA6
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 05:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5832BE03B;
	Mon, 23 Mar 2026 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHV+rjR4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FB5219E8
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 05:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774243042; cv=none; b=lJkqqZ8nrEZO/NvwLgZaNHKP+yK8yn6CiTRKLLD2NMdKxrHWXZUS37mE0whvgg7l9U5C84oR3aPkNRJbE3NhdCKOlftAglpKq2YI+p1O2hiTNihv+lGqzR9mu7P03z9jOytClwkmujjg0FqHNeGrX2ydgHko0XHKgTJBuNwI2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774243042; c=relaxed/simple;
	bh=pfWTJZqaVhDCbFG2fAE5ptgG+qJ6NN4y7N0S/smJD24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUK59TTG4noOKCKGpGr+3LB0jM0jLdMypWE3e21cTN9nTbzjmmDvfajcTrgj7llDuZlgnDjC7BvpkusxBrOpfQ+m5aG/0ynPelA04pr99JTEun1RZrsy49IBceMWk6B0iZL1VjkjCjhe8VRlDEahz8kQvQnAX778HxM1C9vzm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHV+rjR4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3665599eec.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774243040; x=1774847840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Jpqkfz7hZUs+vzaN1OQd+jtBYhuxG1ZULSLXTe38VI=;
        b=EHV+rjR4uLE2ZpVupR6/bntiSBDG/Xjb5SHch7GJZGBpnXq0cb0REaAR7geSu29UrM
         5f7t+R/0xF+JpLTTxsRPkKNtbN5eM8qEbd4VFKyaleEqyJikeXu6Jo0Prtqc8vp7xc/+
         JZjpYHmWQ7uVLX5Uy69gei695XxH3x3uxRYV4PI1+Hws9GTFcZEpcbxO1OQ+0VWXOSJI
         QvyMOrDYlCOKfEIk0027i5KQzPvZdtfnNYZ/+sUgcToiU//PpSTneYASnyag4K2jlN0w
         dg5tUScdeD8qJJP9nS3Hgo41ImVOdp1BcNJh+4vCwLNwQU7ByFppk+DuOcGxk/LHItOp
         eSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774243040; x=1774847840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jpqkfz7hZUs+vzaN1OQd+jtBYhuxG1ZULSLXTe38VI=;
        b=WTgf4GTZ21Z30Po1+ouOmTk5pyG38mEF2NksoeY2aPa1ueilZvZAvWYFp+MEqlyv8Q
         PK5zeFASRTs25MeBzh7A13UziSJ0XRLJRKnBCrMBRXGJVeT2rqfs7iP7zR150XMpWOcY
         dFtMaxkiNQsM7jmv4loGVa4We/5aFUNx9TW9gakYJQoHu2N0QxminRL6YXJo/iqF9qFc
         FDXr0c27o1dRPNO8P3oK9kAX2egOzTmHHck6ZHgVbgh4ID792wEHuAovtvHRBtMKvfs2
         xRfZIkpSl00svX9Pytdvl63/YZL2R9QO2ADpuXEWv6h16vRuBMgSsZ9ZmaEl+HTEeHg8
         1t9w==
X-Forwarded-Encrypted: i=1; AJvYcCWodMs5+RFRMR8RJfmSu0ET2Nw4tTLKmIsuliHShfDvjM+AZaiM6JytoPDe5AmCVDXn3zwXBrO6/Zj7@vger.kernel.org
X-Gm-Message-State: AOJu0YwodO9pxXirjxG8z05B3FBPrMiOVkbNam2kmjt4y/kvDfY3VGqz
	n8fXjzyRsaEMuyTCx7QdHGcBFPMFT/arxDaZEpyRiaIN06eazjNpf+bX
X-Gm-Gg: ATEYQzw0wM5Gq2VIOrv7KIZYLeEdy5jBKdjUIG6a2zXlBb9OZqDFnn9rxjP854NR5YP
	px+GkdChE8RTCwO6LHBdSwmFNBEeZ3uVveBbDmvhTRIxZtw/WJ+sreimVMxHbHRLEQaREAKt7Sp
	DXVGt95pS78roxSuUIWLe9w+2RFmD84BVonRolAfsO4xEqwVU8fwDSNf4MNiFkpJkcnnkPXl11U
	oPWeO/f5Pig+xZ+YVNb1gUqT8o+rYpgQJYyh8pQLs57CTQsMX4z1rGrZEOdHjwO+gh2qF/Lta0f
	baTXvN6ks9/jExdMjqmGoKq7kQXZMdtgv8ukX1lSAxO2G8FWxIHDWiRCkfzaO+yzGaSddiDL6P8
	Y87CptWeEY0I9XmiLn/XqK/YqPpJNHnLs0hxrHZxv6FZXIwpTjwG2Hrd2wbDx4zOeBIQcIDllbO
	AmYBCpYA+IS4Eljv/xzvgQwe+lCE4TaSlPUvrr0UTftMI9f8K6kx4NHKmU5MLrQwiH
X-Received: by 2002:a05:7301:4198:b0:2c0:c775:a46b with SMTP id 5a478bee46e88-2c10961ef1bmr5539127eec.8.1774243040114;
        Sun, 22 Mar 2026 22:17:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm13470084eec.24.2026.03.22.22.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:17:18 -0700 (PDT)
Date: Sun, 22 Mar 2026 22:17:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Tom Rix <trix@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acDLzK8vpptTUMf1@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7424-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 121922EC9B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > +					of_fwnode_handle(mdio_bus_np));
> 
> When you look at this, why is it better?

I think we should move as much as possible towards firmware-agnostic
APIs and use fwnode_handle instead of device_node or software_node or
ACPI companion. To discourage this I think we better remove
firmware-specific APIs where we have firmware-agnostic ones and
eventually clean up drivers that use OF- or ACPI-specific APIs.

Thanks.

-- 
Dmitry

