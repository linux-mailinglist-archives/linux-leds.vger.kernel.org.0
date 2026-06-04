Return-Path: <linux-leds+bounces-8487-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Q7EJv4MImq2RwEAu9opvQ
	(envelope-from <linux-leds+bounces-8487-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 01:40:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEF643F8B
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 01:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MLkgRTsA;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8487-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8487-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0F4303454D
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 23:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8783314B9;
	Thu,  4 Jun 2026 23:38:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458830D3E7;
	Thu,  4 Jun 2026 23:38:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616303; cv=none; b=rzDZyOFx4zhQ+GzSAq+vUDh1hK9KOhlIH+wCc3lenJMZ/cW5mOf8wlacHHyZEHsVZy3Rfus8yceVBBm5EKkVI4jx4GJz1K7NJ6SkPQCTw/gdiM7eDIJx0ZB0zVQ6XWBnIbscvgwVhSZfQjncxH3uakyVaRQNge0XLWX9Whbzuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616303; c=relaxed/simple;
	bh=AIQIr0ForNnFUac72qlS61qyI7V+ThigyEDuZnZVggc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YKYYwWs81HR/L5BwwmUiJFnoJPwvyOlisBsW3UrRpbO3kZWSRI8Bz4EbxFB9wQExTa5+txsUEejujA67yLJuvjLFJkghIEHEpZv1cT8jcnXJNbxuUVzPGwuCiP9r58xCOsF0NN5JOVPTnkPuxDOL8aJepwwXBnwuhTh76bK8DLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLkgRTsA; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780616303; x=1812152303;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=AIQIr0ForNnFUac72qlS61qyI7V+ThigyEDuZnZVggc=;
  b=MLkgRTsA4wqeNG3CFvCPsm90I7v99kMmSUnnDm3bAQR/54SIkf5HNhGQ
   caWXiQgaIiLPet3khnX9YqWl4Hv48hFG9Kyy0lU1NuVwnOcFYd/kRwMH3
   C/XTqWtBZLJxCvK467Hf3HqUKkEZ6GrOHr+RJiprQbINyTDNmrRd0UTTy
   ObpCYXaF7MDcNTodRRglKU9+aXD0hXy6W9moLq/qnw3hxDoy26ERrYWF7
   llTPDYfgwh79vjQv/jUY1FnAYsYPB2K68YXkIaCdpkxkXzfZwNE4GV+NQ
   guy1ZH4q/7ipFIXLmO3BSh8zLyJh9E2fJIg1vVJwdT34h/QgozGEwki+t
   g==;
X-CSE-ConnectionGUID: OkCK6wYBTdSAW22TxnE8Lg==
X-CSE-MsgGUID: LqQDiDQoREe7nW6WcsuI4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85075913"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85075913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 16:38:20 -0700
X-CSE-ConnectionGUID: 8i1oTar4QXezo2FSoxBVCQ==
X-CSE-MsgGUID: LcsHNHCoTGCVhaZdDEqLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244744337"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.88.27.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 16:38:16 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com,
 maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, idosch@nvidia.com,
 razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v2 08/11] net: sched: don't recurse on the
 netdev ops lock in qdiscs
In-Reply-To: <20260603012840.2254293-9-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-9-kuba@kernel.org>
Date: Thu, 04 Jun 2026 16:38:16 -0700
Message-ID: <87ldctq3kn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8487-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vinicius.gomes@intel.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinicius.gomes@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8CEF643F8B

Jakub Kicinski <kuba@kernel.org> writes:

> cbs_set_port_rate() and taprio_set_picos_per_byte() are reached from
> two paths and both already hold the device's ops lock:
>
>  *_change(), via tc_modify_qdisc() which calls netdev_lock_ops(dev)
>     before dispatching to the qdisc ops.
>
>  *_dev_notifier() on NETDEV_UP / NETDEV_CHANGE, where caller
>     holds the ops lock across the notifier chain.
>
> Switch to netif_get_link_ksettings() to avoid deadlock once
> __ethtool_get_link_ksettings() starts taking the netdev lock.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>


Cheers,
-- 
Vinicius

