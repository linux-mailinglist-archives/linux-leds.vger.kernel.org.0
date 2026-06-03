Return-Path: <linux-leds+bounces-8472-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nktLFstfIGpI2AAAu9opvQ
	(envelope-from <linux-leds+bounces-8472-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B363A0C5
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kuu8xEzP;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8472-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8472-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF05C302588E
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 17:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A023A4F5E;
	Wed,  3 Jun 2026 17:07:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A93E3C5F
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 17:07:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506443; cv=none; b=sQ2MUfvMg+WzTYUYldTwGZ7hPcEcTO5H37BbvQOfdckmFTgPZecRxj90Z5kKBSpaApQ/yL3Svy/+HqvQHud4PLoW7mnYRlikr6GQKWoD9unjbqE+texMiae9NBvf9sz9kMN9quEcF0UWrTjKn6o7SinLh6YQPhpl7oRGWH1PjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506443; c=relaxed/simple;
	bh=VI9XorPSlhfHmOeG230kpRBkPlDvZ777QxVLMeV1TIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTrhvWUe77vw3j9WmyRVISaCXidlmjUC2huWh+40t2a73dem36ycybs1Hl9CEbWPE6ug/xA4sgAtrXNBDbIyIyuR3pcAG2lEYlRVumztYb0urQbB7GkSbXpWHxzbUaHUnMeDYa619heXyRQabsiLEZuZgt2UJ2vtr8S171lU80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuu8xEzP; arc=none smtp.client-ip=209.85.214.195
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2bf125989f2so45788395ad.3
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506439; x=1781111239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TihK8TLFQ7eWvBfrOf1I2w6CeTT78T3znP19Zg8cOL0=;
        b=kuu8xEzPGVtYcbUdgLVRDz7jEPpovEu29/xKnSf/GKM0yiEGM8UWbgNu7fsWLxbipW
         fj9xO0HR8WQ/fbGPJKNwofyZHhK2qetgHoooD57wE40x0Bkj1J8+OsYBbcJB3o4qt5QM
         2iLcTnDF5R7qYKotQ2CqfwmPenDNmVaLQir8VlpEYBucx4M1TdSLyBOvwnpfV1iJ6UC3
         UUan5QKGJd988cqop0i/LgFr/ENIC8e654sSJgJpZNXYBVQusgC4hWCLcgpOy8Gs0P+E
         UMAFqiIGO2P8YK6NsGNb//DD9V1atlGEtoVfr26L684pdzm23Yn/nuE4e1YxtKDW0daV
         K6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506439; x=1781111239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TihK8TLFQ7eWvBfrOf1I2w6CeTT78T3znP19Zg8cOL0=;
        b=bf3YvJVsWFamFwhPwAou80fdtBgsDdEcOouc4M7wOzabYDhjlZFl2Gg6dfiSmGaYp4
         ujp9ehGx8iYAI13tJWjrvkr2neDZEt+U1UUdmcSCbmjvRkV/Io9icGa0vCjZ6Edz+o2U
         SsNyrJ0rsJB1oNR6/usJ3POaWBiT6G7SIcDgP0KMQDbwczQwBKIpYRRuu/WHlik72Z3C
         ct6C41g1bptbsYdo3E04hqrtGW9n1ujq1DNdi8aQ6yOJLWmqfcISQsLNgAsh88WirOW8
         eT248lM5DvEpRVBmQOZMwmK6XzJ4a/4UWCKiaN02+V/vAfH6TKQzAt7ei0Yj2nmd4LIx
         XTog==
X-Forwarded-Encrypted: i=1; AFNElJ8mqYnACKm3NU66NuBWWUGOFFEF94AKPAlOALXbx0XyZi8/zqunc1/KobWfgasEeC/7QmqedsmJKIBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+kgZYR134Ff5k6/ALMIqjJumWsX0ll39hU06mnQ6L+Rn9MtUB
	VHjrtChuOzATjR3eVxEI7QtCQLZNvHaJx5GsdhIFBzv0K2ABmQFxT464
X-Gm-Gg: Acq92OHgHgp4MBeoSwGXXCe/uqWxLmv/exGIBQty8kpjtpuB/lqCeMGeL/596FrCLIj
	v75mH21zsiXu8Tk0pXmuSRt59QO/+TYNVatT1X1rnuvkacptRhnHVYeyJk2fI2vwzLJn+BgYsMY
	vNx3eLW9pPCH3T0qax6xs5nOys4rdDLv+lg/R4EHjPHi4Dt6/P1IysWxTPAqqIcRwTAG6T8ZQbG
	jHl7o1EjK+CXj03rzwWpSeFlarBrRTndAUp8fze6lYg7RuTDumruIKL44VUGoUwmGLjVrmceth7
	KvwLwaLzXOCHT4+ewFDmhX9oaA203STuMpt5jYj4qxwPkWz8S9eG+/JJa+4KRdHmGZqjFkmjjg5
	n3Xhy+OagxtHkaL4TazDL74+G6TMzqNJzAUS4nZsderSl51uxiWNJwxvXsqGF1XLynjD/So+qs5
	h6lNoaqdsiziWClYpv6QXAd5mMOjg=
X-Received: by 2002:a17:902:ef44:b0:2be:22cc:e227 with SMTP id d9443c01a7336-2c1639ee5b0mr42224385ad.4.1780506439527;
        Wed, 03 Jun 2026 10:07:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm32078445ad.53.2026.06.03.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:07:19 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:05:45 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com, 
	maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org, 
	pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com, 
	vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org, hare@suse.de, 
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 01/11] net: rename netdev_ops_assert_locked()
Message-ID: <aiBe4-1vnkJJHwHo@devvm7509.cco0.facebook.com>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-2-kuba@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8472-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[sdfkernel@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdfkernel@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fomichev.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC1B363A0C5

On 06/02, Jakub Kicinski wrote:
> Jakub suggests renaming the existing assert to match
> the netdev_lock_ops_compat() semantics.
> 
> We want netdev_assert_locked_ops() to mean - if the driver
> is ops locked - check that it's holding the device lock.
> 
> The existing helper check for either ops lock or rtnl_lock,
> which is the locking behavior of netdev_lock_ops_compat().
> 
> The reason for naming divergence is likely that
> netdev_ops_assert_locked() predated the _compat() helpers.
> 
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

