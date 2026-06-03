Return-Path: <linux-leds+bounces-8464-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NsgTA4sPIGoevQAAu9opvQ
	(envelope-from <linux-leds+bounces-8464-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 13:27:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D663706D
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 13:27:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cloudflare.com header.s=google09082023 header.b=WF05GNAu;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8464-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8464-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cloudflare.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 476BD303092F
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 11:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF44E3CAE9E;
	Wed,  3 Jun 2026 11:15:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992035F19A
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 11:15:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485312; cv=none; b=QORmwxV08uIIhmMEQcM4p/pIddbkC2O4Iu2SeXuiRzB0iGMj2xvNbxxatuKHHaeWW+Y3eYY8v+CCRkdBO8Q/DpuyPdNGQNZxkyDsSo2NobhpC9G5rz3pt7MEIyDqTexQDWAFjlfW3t6PeCARvhKawiH9z3orYC3HhGa2U4oqzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485312; c=relaxed/simple;
	bh=IYQ2aNeY+X4nQfJBL0t13iSGFwakR7F2aCt2177FAvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f/wJFJ5fcAi6L4RfMiVHu0KVDiDY+KJ1TxSszqVMh3TThBn0LJoX7kzdjL0ZCA6QefLMV7mNC0QOObKQQPDeJeNHWlLoxhE4v0uRIg6JInD0Mz6ExBf44DHu5oSVUTYB+u5KLh/dh/d5z2BNBwAm0g6BHMAGmMs98EXzhTiI9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=WF05GNAu; arc=none smtp.client-ip=209.85.208.50
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so6906436a12.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1780485310; x=1781090110; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw0XW6MjQE4Q5GmtRBciMOYe8JFJUy2Q42SiJpNGiVM=;
        b=WF05GNAuQR0KINPBBRORhhKTz6ecvHNw28vGLi+p1FbhvWYUn3EEcezPO97xWtnC8U
         aKQQ+Bz3oIsDO1hVDV8nTFYKXC5FLWE8D0GdJcXv53M7DdQ067YI2qIKw+xa/Nr+Z+VM
         e1QhNq7bE7hpUWqev2Z7qVVRJo4wlYMvpalRW0gcRGDBydbdWQPjXpNfYTZLbdMriUlv
         UxzocdsFIzoWHIne+9XNpMthpjAVxpo6qfJQWu4rJbUq30RxETenina5QOM0Lxgmknp7
         6G8rKSoNY4/XsaWwGjowJ7PzEIDrSyOLnMJxuAzwLaKYQLuN8HlXHpNjcUdLAFab2qs2
         Ph8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485310; x=1781090110;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw0XW6MjQE4Q5GmtRBciMOYe8JFJUy2Q42SiJpNGiVM=;
        b=C9O3j11d2lCdfUDD/GMFgOTsCGOhU7Qu0Z3vIVe0Tyj7rg2A6fXKdZKxZLjeQutQdd
         agmJZLhzGroA3SSwRhgW0AabRXjyfj2xgBIdjrhQDqIwVy3nUY8uAtkDg9VESm1d0th4
         4OdDVv+kU8vKOygX8xRDvs0GDZWy8NGKexNQomc9DrAMvv6oy9P3mN18EOJnzYZqpDuN
         Q17q/NJq5fKUhAjUcwRdXveM9k4+OhQ4J3bFtOB8Z83FtniqCVSeTHRBG9pEne7rel1S
         kie6pGjGokxGlthp+06D+LSNU7CgN0Xsaqr1aHEZoYPNwxU76lmsDtVU48mtvQ97KOVt
         5fwg==
X-Forwarded-Encrypted: i=1; AFNElJ9iJSLDYDisc3SPQI9UvAJn2wzL+Y0YHhCBa47vTSLmXKQzUGdPbddsDUlU1sSiJTzUlITW/VzVp/hP@vger.kernel.org
X-Gm-Message-State: AOJu0YxE83VbKjd4Rc2aJHnxfdAhoU0N4n7apJl53pwzDl47IhFTSD82
	GozML8+Dk5o8wDERAo7pBVRBDYgke8np7YI/NoSBCDJmoLWVfVcXqp4AfJN/Ghb6fvw=
X-Gm-Gg: Acq92OHJyzTs8pZLGZYT8igFd0LuPhtYbDpRK4USuM2V4Gv9rKdX8JgxCUGzZuro89t
	4aIUi+PcW0fO4mp2yFgYEGZ6fa9eG2LhbB8NJc9zHMYNssEsHLtF47wwvw8TZ+0M2pDcTWuCU4K
	H9i5rix/A02++BP4hgM5bRN71ESFjiMC91xqeBi6jLQd+XCWz/P6eua3xVMf8W+ArZg+skhw3V4
	rN5ONLhlomZfWaN6gNzX/REIJJ+RlcGdr7KkDNxKpTOb0swZrSp5gECgOLl7d6akX8kYsFiLt05
	YvEKhyUVRIWlcIOMQ+lH6AkRlvXdys70pIqFFJaE6vcgHpeTJHEht1JmKYINFaoLFARV4m6rc/I
	cXgHixDtfWlGmM+/QFcMXZwBtPDeh+3dxmBZRFvpdXAkM7ZbBoUifNCPGM8ix+WmWLIbQejkEZi
	37JNgPDf5bCIpxplK3dJRp3WfznSMdrj+4Y/i3sEGo1zEkaTmO9jqL0cQK52kYX1dBIa1aTzYKa
	LJbP8uvJfs=
X-Received: by 2002:a05:6402:50d0:b0:68b:5418:bee5 with SMTP id 4fb4d7f45d1cf-68e71aa2f01mr1359654a12.25.1780485309927;
        Wed, 03 Jun 2026 04:15:09 -0700 (PDT)
Received: from cloudflare.com (79.184.120.122.ipv4.supernova.orange.pl. [79.184.120.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65c542c7sm1018281a12.31.2026.06.03.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:15:09 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  maxime.chevallier@bootlin.com,  nb@tipi-net.de,  lee@kernel.org,
  linux-leds@vger.kernel.org,  pavel@kernel.org,  jv@jvosburgh.net,
  michael.chan@broadcom.com,  jhs@mojatatu.com,  vinicius.gomes@intel.com,
  idosch@nvidia.com,  razor@blackwall.org,  hare@suse.de,
  jhasan@marvell.com,  danieller@nvidia.com
Subject: Re: [PATCH net-next v2 01/11] net: rename netdev_ops_assert_locked()
In-Reply-To: <20260603012840.2254293-2-kuba@kernel.org> (Jakub Kicinski's
	message of "Tue, 2 Jun 2026 18:28:30 -0700")
References: <20260603012840.2254293-1-kuba@kernel.org>
	<20260603012840.2254293-2-kuba@kernel.org>
Date: Wed, 03 Jun 2026 13:15:07 +0200
Message-ID: <87zf1b50zo.fsf@cloudflare.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[cloudflare.com:s=google09082023];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8464-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cloudflare.com:mid,cloudflare.com:dkim,cloudflare.com:from_mime,cloudflare.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 034D663706D

On Tue, Jun 02, 2026 at 06:28 PM -07, Jakub Kicinski wrote:
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
> ---
> v2:
>  - new patch
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>

