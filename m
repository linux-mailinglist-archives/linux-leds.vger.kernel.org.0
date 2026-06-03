Return-Path: <linux-leds+bounces-8465-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UttWNGMiIGqWwgAAu9opvQ
	(envelope-from <linux-leds+bounces-8465-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 14:47:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDD637AD5
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 14:47:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cloudflare.com header.s=google09082023 header.b=G18ErR6B;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8465-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8465-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cloudflare.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9A053015C14
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 12:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554F2480946;
	Wed,  3 Jun 2026 12:47:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89E47F2FD
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 12:47:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490838; cv=none; b=qIYLoZIsL52HNHskqgrsiG+lP2PorHF+c3NNcNiw7YE8LdDW0YICCGSXPz2uk5lZhP2F30oT0hCWJb2HGGQ85htQ5+je/1fBK8tpbDDp9yiu5ul8OKbppp/lpnDn2y9KdU8nln+Lhpm+2Ri4bwO3pVQPv7HzDcCDLWLkZ6CzXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490838; c=relaxed/simple;
	bh=UqiTc5uJeCStJmC9RpnHPzx217mtLCKEuO3YakKuRZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JO28gav9w4iQJRP50PaHTA7w5XejRNDZ+awipRq2uOtoh9iptvB1D5WOWwSitq4YyLsZLFvakIMp3yYGBZcFF7Y35/6fr1pNdCRph3jEg2ao+VsfOQ7t5pYoAMlYF3DP5DCMk5txXSNEQ6c3vvfl0B+6C6r2ecR52qSxQUC/zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=G18ErR6B; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec3f69d343so528165866b.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1780490833; x=1781095633; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8IHtiFTYRJaSwK/lgA40BX6+K7NCg68jEs/RoM3v8w=;
        b=G18ErR6BEly0K+5NGJfw9qWzr+KWN6yubENy+7Mt+bNF1Wc+DuGuwO1iL4l18AMwie
         6AVRrUM+tXw8Gj+0wattnN32jlCeOcO6QM0GlbEyEgV09DHGBLqmVew6EL0HGybHipFq
         ZRH0rDV0WhLv/rx8KcnWnaNlohdiXG9DqTtwjlHtCjTQ4H05ouGYhNe2qdDmXXO5vBEo
         k3v5e2LwlgiGP9p+4XqzAp8KDtmctUfned7hn2/7xDBqctMwguo5bNTb7SHuawnmnbnF
         x8pF4uGVrg/1y4fAx3UOzKxpf6rOhWytgGpUCWac+6fiYL4a591DjpTZe/bJUZ4UtRfn
         ewpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490833; x=1781095633;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8IHtiFTYRJaSwK/lgA40BX6+K7NCg68jEs/RoM3v8w=;
        b=FTpCu5PTXhUnwfQhGCZL9NyTVenuqTpS5KYC1Iz/ET4o9auCzVZnIubJ9GWELdD8Nn
         s48Iz0AAeMV9HGPIRQy1NLFZKS6VACCs7akC4q9tV+ec05YVvbk7orFlhjKA3xo9a+Eh
         y5irjTKxsK8c583+cFrRX/ULuqkBEhXOGtZFVkf02V/OkziotTqZXQyE1722ZB2rYh8t
         NXSVa6Qm0rTJhTCQFtTbvlE04y54vrf2GeNdvhQ8Qemgy34KjOkWBt6qAY1Qz5K70MMP
         r/DJIkTGWn/5ir2XmsFgucBN1bKUODvLKEzulxoMLorAWfsTzMb3xt/eFXA2sWKRS+f0
         igNg==
X-Forwarded-Encrypted: i=1; AFNElJ9i7hdEijak43ukrNU/TAK/PgcEu/AdBabgg8Ndo4Kusc9ozzA5Exn0vZQ7rzfKBv3ecCJnzQsXOqDa@vger.kernel.org
X-Gm-Message-State: AOJu0YwT83fOuxio2vsnjrMYO7gL7RojB28ieZa6jiZzqSLv+E3Wogpu
	gM2/NeRQGAH0u0ZI0UR5AFfGNqyqB4S3WX37l53hJLZ3L7QEVh20JU6bRyrVF1i5bXc=
X-Gm-Gg: Acq92OGDoVV/rY6QELGq6BtYcYW6sXSCfYKl7TUIA/eS4kW4LZHUNBWVLRG1BL1/Edy
	uPmTXJM/WGwCkdIkI8lRb9mSsvnKqrk/J1oqKllZGg6Wc3H0YBgpKGt9yfLcgxv25Fh8EEIFReT
	TPKSKXsky8dMPWUFgQJj1TRup93M+4Ch6BMV5sg1IzX79v6PWQzoQfcengJRwrTvKMmKPJ2K0GS
	oc+LlWYUSSKpaKWt3ZG05f3EFiB3WSqzQ1nKZ73HjOtC2pkG1v+wATfugilgpXn/zXx9k+6Gu8F
	WAJr71WSnEADE7k4Q3XHDv/AgHyxYLDl6JPH8zRkQrg1Ubw8uVmL66DsjXlXmMThf9+MXjbo8fQ
	wrB5JGcgqz2nu56BhY7UeyVzL08OAGo6m0OvOA0cOfgyg/FDoVu0RYMqA15KIjzYHlkp/4qmMa1
	MUfNtdSRnPptf+8QFybVGSMsOG1xpSLVS98jPiJoOAH4zKIdk=
X-Received: by 2002:a17:907:d8b:b0:beb:3dd8:f896 with SMTP id a640c23a62f3a-bf0ae9fc852mr160451566b.34.1780490833586;
        Wed, 03 Jun 2026 05:47:13 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770c7csm151899166b.12.2026.06.03.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:47:13 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  maxime.chevallier@bootlin.com,  nb@tipi-net.de,  lee@kernel.org,
  linux-leds@vger.kernel.org,  pavel@kernel.org,  jv@jvosburgh.net,
  michael.chan@broadcom.com,  jhs@mojatatu.com,  vinicius.gomes@intel.com,
  idosch@nvidia.com,  razor@blackwall.org,  hare@suse.de,
  jhasan@marvell.com,  danieller@nvidia.com
Subject: Re: [PATCH net-next v2 03/11] net: document NETDEV_CHANGENAME as
 ops locked
In-Reply-To: <20260603012840.2254293-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Tue, 2 Jun 2026 18:28:32 -0700")
References: <20260603012840.2254293-1-kuba@kernel.org>
	<20260603012840.2254293-4-kuba@kernel.org>
Date: Wed, 03 Jun 2026 14:47:12 +0200
Message-ID: <87v7bz4wq7.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[cloudflare.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cloudflare.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[cloudflare.com:s=google09082023];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8465-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[jakub@cloudflare.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jakub@cloudflare.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[cloudflare.com:+];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cloudflare.com:mid,cloudflare.com:dkim,cloudflare.com:from_mime,cloudflare.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BBDD637AD5

On Tue, Jun 02, 2026 at 06:28 PM -07, Jakub Kicinski wrote:
> NETDEV_CHANGENAME is only emitted from netif_change_name().
> netif_change_name() has two callers both of which hold netdev_lock_ops()
> around the call site:
>  - dev_change_name()
>  - do_setlink()
>
> Document NETDEV_CHANGENAME as always ops locked.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>

