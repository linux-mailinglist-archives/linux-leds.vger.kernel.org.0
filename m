Return-Path: <linux-leds+bounces-8474-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BYkyOORfIGpR2AAAu9opvQ
	(envelope-from <linux-leds+bounces-8474-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CBD63A0DF
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hdczkQaV;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8474-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8474-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42B13302D0A2
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 17:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1605B438FE3;
	Wed,  3 Jun 2026 17:07:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD144D021
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 17:07:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506444; cv=none; b=M2Uv+47HR1Sw70Pso3ybJrxqBre4I6FcEe81sbYO7DOf/q+dCUfMriVa6w4YEyoTdKeiCAgb+58Esmzw8K39V1FdZ0mE+T9QZyOnXxOpaGluThIxqSQcc9sv/sXiYQE9Ekgqe8myf5tIoQmdqHuxDFAYb0C42cNrx/1cNyFa2RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506444; c=relaxed/simple;
	bh=dA0TPAl0/6YRI7m1pp7g6esmakoUZdBAGb9D0B1FbuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYYNVuEhRvcrD/PK3H4gSqxVdeNKL70qJi+N/XgrYXBaT9rMrEdb/PgVe84cXdKXuyFTZoxFC77j+CtBO5dBz6EgcmDBcX3xH/3KXIqTnhVfC6bMrT6UOSK9NcrA2Tl+55bkDongnZFCuR118+drT4trINKx/DaD6Dh/i62tBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdczkQaV; arc=none smtp.client-ip=209.85.214.195
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2c0bd02d97eso47499815ad.2
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506442; x=1781111242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X33UvQUnGJC3h8LUMsBQH32wmuT9+nkAY/1g3EYkDig=;
        b=hdczkQaVo8WGpPnr4pq3G3zVdrgXmZR2g4gbwbXrMaAgNvGTNRbjFMIhFkYrbLfpeY
         9CwTFjGWVOv2XvKMkkNlUTe+DYIdBCjAKZG9eGvo1Bg//6Jv0gcVKKbiolHISfETMaKw
         q+4tfJlYHQTm2JB1ZfJBh5SH88Bn3eScORDtCozStm28Fz5E5yZp5BZH9JCnfyKR0j1j
         XW1lYiA7m742tC7D9aQjc0VXxZF0Qrfrkd7CM43YIcFuSm9PBBoAfyEbrBBncrBde6y1
         DmPxy/q2BRG6FVhrFyvxdhdwzBv4xghJBXJGhObPnbBZPfMB8Vwf4ljMNit+NR0JpyYy
         fZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506442; x=1781111242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X33UvQUnGJC3h8LUMsBQH32wmuT9+nkAY/1g3EYkDig=;
        b=AP6AfPpxJa+/UsT6NCDX8wLw/K0iJebTPs1PW1LJHCYB+v6/e2eVa3FBuzcleNP1DY
         rQw9DWb1/vDFiXcrtnlzl47Ba4kX9EQyDP4i5WXelRcb5S0QqYhbyTKoiRdpAr6qg3PU
         w/qLeh1h5nmKO78poYD5PQaaAsv28+5NbQYCjR4GDWYwufFNaFMnynrjy/G8QLRaC5ym
         K7msdAhHqxZjGalhM7CNrlfOwhgwyAuFwsYBYtwXWEdTNJx1o50OvJwnLPh5Yn2/9hp8
         m8Q5P2m+L4URtaW7iKOZTz1ZKxGWKNpX6oqtqb04Xwxnj4EgdjPksDbkzxdQ1YNLSuVH
         vFEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WmlUPCOeD6j8anjS84lw19oAVNzQmtyiO8Y/napnGV9Li8xINNNlanzcJysyhCq9evfbaOv+9swVE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78kFXG7O6FunAVUpF4WMYkqRg7vPuyQJOmLzEto0YcrcMuVkW
	aUHnN8UpqGJO7yIBxX7b7eSUnyfiE6ZiZM9PFz8l30t7P0E+kKuF/pN0
X-Gm-Gg: Acq92OG33GbzHqr5UI7rwkpGKqd7GHfR2EtpMU3IjxbEKClm4t5nxy5bjZoW36ojYIo
	vEN45zu20d6yBICHGodlRrJzAXMxdI2bhzqXsYK9tMJTMw+xyzQWOWMMk5GB6/ajUlqZCdY8MOB
	c7VP22Yt9fa/zqcEg9OgYdG/409LKqPb3DrxpV9xfODmDJK8dm7etdyteMn4FTIrbxJi2lyTP4y
	Ua8m/0uv4i5HGpHLlO/oz3L3vXt43UPfsWh3Jrn+HrRHupE3yaJi2yMjZRnAYNGxjVS25GpQ+bC
	lT8k15dbpL8Pu1y5pJKtXZPWj0efdzUsy2zW2fl/UeQ0cq65A08RACu4V52VYcM/+JtSlqaG4Ka
	D2PcNNNVF1hTdbaPbLy8E/35joNcZNQue2zNR0eL3ncsnuh7ymUAM8aJNsnanD1PR8s6eU1BQX/
	DVKYhp7JfCJvh188TtPpApzmoZb0kkLzz9+Kbt
X-Received: by 2002:a17:903:944:b0:2c0:a360:45e9 with SMTP id d9443c01a7336-2c1644a65b1mr44910355ad.29.1780506442184;
        Wed, 03 Jun 2026 10:07:22 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:2::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm30904975ad.50.2026.06.03.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:07:21 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:06:27 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com, 
	maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org, 
	pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com, 
	vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org, hare@suse.de, 
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 04/11] net: ethtool: add
 netif_get_link_ksettings() for correct ops-locked use
Message-ID: <aiBfDEM-WsYyKxz1@devvm7509.cco0.facebook.com>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-5-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-5-kuba@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8474-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fomichev.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54CBD63A0DF

On 06/02, Jakub Kicinski wrote:
> __ethtool_get_link_ksettings() is exported and called from sysfs
> and many drivers. It invokes ethtool_ops->get_link_ksettings
> so by our own docs it should be holding netdev lock for ops locked
> devices. Looks like commit 2bcf4772e45a ("net: ethtool:
> try to protect all callback with netdev instance lock")
> missed adding the ops lock here.
> 
> There's a number of callers we need to fix up so let's add the
> netif_get_link_ksettings() helper first, without any actual
> locking changes (this commit is a nop).
> 
> Not treating this as a fix because I don't think any driver cares
> at this point, but if we want to remove the rtnl_lock protection
> this will become critical.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

