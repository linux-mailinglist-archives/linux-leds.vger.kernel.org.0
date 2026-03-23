Return-Path: <linux-leds+bounces-7453-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPdaBzq5wWm/UwQAu9opvQ
	(envelope-from <linux-leds+bounces-7453-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:05:46 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC702FE0E3
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F113055E4D
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEEB381B0C;
	Mon, 23 Mar 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zoFoURr7"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F63815F5;
	Mon, 23 Mar 2026 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303225; cv=none; b=R4QBbDhwf+mfyZmp+pSpPmMbm161JAP7FzcSBaPpAMR65BMB7xTdBQsuaVRtQb+eI8Dar+7mcTnBBy7K+MkI54wHh3eQu1ke6zglnON/c4yP7Emfqj0tQu4EtDOlshQscdbmVW70bX2g/vgazRT2iD/SnLwjvFMnaurPam5/Szo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303225; c=relaxed/simple;
	bh=nms2UrqNVXB8k/Cgw5IhiJnNnuAaZNVwNieRIfVLocQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDGgiDjQqZq392WTDIZwrBWRVL7MfqbXD4fGK5tmPYZMQwcpEUYIQVX9ipH9Nwm/oQqyJJX9LX6jj90Zpvxg/sA7cpFs+ADYeXkmEqccgtn4JEtONnNolesI6tShXE61JPYAs8g9US81kKY8tqfp7hTD5Fq0U4q3V1mabCiN75k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zoFoURr7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tA8Yyp3IK6KA9nD2H/oX2M98oX5IJL2zcqcpcrwKhHo=; b=zoFoURr7USEP19LNqesZHcvPjG
	gplxLeczw9IJ8cVhFwYR1wOxXPvpc+klhiIR3xBiX4VcfcWwXh4VGxG/MTmcueynV3L4BBMsF9F9z
	Ucfkmry1oai1diUWXfonwGuOcyPO+EV3YZLll+CiJmHtQ8MHWScurX4uHQEsKDDVlc+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w4nJd-00D03N-Qk; Mon, 23 Mar 2026 23:00:05 +0100
Date: Mon, 23 Mar 2026 23:00:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <f3c51f5d-e001-4a6d-a219-f2e0698f35f9@lunn.ch>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
 <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
 <acG1JNGVBJ2Mf7jC@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acG1JNGVBJ2Mf7jC@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7453-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[armlinux.org.uk,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Queue-Id: 5DC702FE0E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> BTW, why would not we want to push for the unified binding? They are the
> same pieces of hardware...

I don't think the ACPI committee would be too happy if i ask them to
throw away their standard and just use DT.

ACPI and DT are different and we just have to accept it.

Nobody really cares about describing networking hardware in ACPI, so
there is no need to support it. KISS and keep everything DT.

      Andrew

