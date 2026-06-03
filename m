Return-Path: <linux-leds+bounces-8473-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B1kiGdFfIGpK2AAAu9opvQ
	(envelope-from <linux-leds+bounces-8473-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F163A0CF
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 19:09:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DvOXQ4uM;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8473-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8473-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31ACF302622D
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 17:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF7044D696;
	Wed,  3 Jun 2026 17:07:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27F42314C
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 17:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506443; cv=none; b=meuzsEb0CaBf3AYHGQB3KF7o6ttJluTTtMETlNcsAD4wzZD4HiS5WF3XBJ2vvI1AV3cR/isnKDaGfVmfu3HXBXfjqx859u8zYuQ8AMaOmzBSCoVMkDSTOvSRWVEw6fub8hvm8t2NAJYsUbDKnHOlF8R779nsiZzFm5+UxU5gZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506443; c=relaxed/simple;
	bh=Q84PxrL0M3LP7kpxOOlYGuGcFjlAklgf4n3ZZ3lVgAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDjWz54Cd1NHoF0k0SKehboG13GLRUHX22dcJhOLsSp44V13DbbxTXmQCSZ3u+6DsujXhsj0O0my7OX9LESuEkSo9GMnjzBqsQmD5ydGt5oNh+1se2OuvjMC8O/IB711AISFxtqZfFLdPs9SUji8wgQ90TgCYjm5JQNgHiU7meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvOXQ4uM; arc=none smtp.client-ip=209.85.215.194
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c8585cd8400so1839959a12.3
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506441; x=1781111241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsFi1nrd2Dnq7W92MrGaYgBJMerHJ99RIVvqt7hw2QI=;
        b=DvOXQ4uMlHWF//PpvjTrpCCcKTvwuAMTH+2IFAXJKNBMuS/RsVZ/1/jOGSp87TLoWW
         7k6AEbm86Ui9buoj/9jNjGrCIhnCXs3J3og7UREKa6MZXMwQ/l+XvmqSx4UceetD45ZS
         zjlEgLTGcLIkdmclW/bfAOwwys+7bRIriHrwBzWzoNbGW5qZbGyKX8CO5eOVs6crgnUA
         I5xhaY/kJyIJwkN9/+STgPuj7gpR0cXshpUtwluPXY5rsscgBEWNErxjX/uIV+5j9K/m
         ELcbknThf0JEXq0wnwegDNAWOX/12LXby7YZ7Qm1b4e46Z+f6hiY5mCB2rcp8QIi+nY/
         hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506441; x=1781111241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsFi1nrd2Dnq7W92MrGaYgBJMerHJ99RIVvqt7hw2QI=;
        b=cyZS/awoyozRAUfi893UDvehHFseuPmOaLnphpUg3a4CmOC2pTUOkf6ZntS1jlY4dM
         MBtYYnrU8NpBSERSSFAr/Ecf8aBzAj47FTxvk7Iboq63CS/zONbIEXMr47wYDMPYGrqw
         xtu+EQiwL7PIEOM6Y3k2gDKcYr8fELUgXBa/PRxRO87Q6IUQWLb2QQjBjDqP3wGAzh/+
         thZ2/KDM5dCq9rC4RtiTq49kUba1c3ZSUsPIybp2AhLMpBXLTNMjVSWTGTtknzIc2/HB
         Iy/yqGdm/j1LUPsqAIivUSqq3jcPtHud1J1TRZvXbUur9k71Kp8TCeNHwEyfUgfPXAr8
         D3xw==
X-Forwarded-Encrypted: i=1; AFNElJ9f9/rnx3/ThxYwCRXzCcH2s93Vow7O/5e13/p/87Frk5XZ/Lv396SIObE9lnNPS7ScyJqufpkGK6tn@vger.kernel.org
X-Gm-Message-State: AOJu0YxCT3H3tkBhd1kuZRndQKWJXk/d/COAtkUdJK9P7yD9sZmtS8H1
	5A6hB2dV5DkCN7FagrbbIvzPTKk2UhOdz4cHmGoGfh5xdbWl79Q5teF9
X-Gm-Gg: Acq92OErWmi7dDRnm6z43zLDTYnfp/5WGiE/ipkQEf/wjRidO1VfkgKuG7N60p9+8El
	8ol556unOtjRVzcHkI5Ke2E452g1Xa9JlmXSeFeXodqp+B+e8fWyn3Y/Lnbznt8Y0CCW2qd004n
	qIY5BatApEEdk4PUZIIjKtZNsCNm3Qx48OfwRnjF+Weo/a7rQ7exSXf/7NeruC+kewv7Vgoss8G
	iOLe3fsDZISMW2P5iugiSHVU6cXAj4atBxA5NC0445Z/QOkAk3QzxpjIHe/tUx2kDYs7LvLPylz
	WCmQczzpR1h6UidUt9VIhgE/M9KaRiJYYSdm134ZG7pkN7HwlniktLPgpEf0dAw7LWWeqTY/HMP
	1ZfxsYcFYBQBM6tjOLLCFu7aJobOyHJj7OAvwLwsNEXcn/rdvluG9JtPtSaf3wkVaMilRgJcxtv
	eZBpUGwo3VNXFG5+OFhynqwtp2odw=
X-Received: by 2002:a05:6a00:90a9:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-84284e240f0mr4157673b3a.9.1780506441319;
        Wed, 03 Jun 2026 10:07:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm4258868b3a.49.2026.06.03.10.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:07:21 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:06:15 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com, 
	maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org, 
	pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com, 
	vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org, hare@suse.de, 
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 03/11] net: document NETDEV_CHANGENAME as ops
 locked
Message-ID: <aiBe_gvfk3618Dhr@devvm7509.cco0.facebook.com>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-4-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-4-kuba@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8473-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fomichev.me:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C96F163A0CF

On 06/02, Jakub Kicinski wrote:
> NETDEV_CHANGENAME is only emitted from netif_change_name().
> netif_change_name() has two callers both of which hold netdev_lock_ops()
> around the call site:
>  - dev_change_name()
>  - do_setlink()
> 
> Document NETDEV_CHANGENAME as always ops locked.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
 
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

