Return-Path: <linux-leds+bounces-8657-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nm2wBSfQM2riGgYAu9opvQ
	(envelope-from <linux-leds+bounces-8657-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 13:01:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A705169F955
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 13:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BKBB+g6Q;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8657-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8657-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72710301A90E
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C3F3B2FE9;
	Thu, 18 Jun 2026 11:01:51 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC043E5A19;
	Thu, 18 Jun 2026 11:01:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780511; cv=none; b=M/YRqKto9yMh+7RiZbRJolVR/gkLouYSE5iwv6PDRVFo1f5hrV6XO05GVSyiN8J5ub+cuL+qQ/oKafC2p5gkJE9MNKffa/hyymhQ+1Seo6peKrHA9dWMZzv2zLeIx4D6YNtfxv1DyHBUOLQA9MUhXXnrunxczgGFxZbl7KgZhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780511; c=relaxed/simple;
	bh=QL/P5Fre2/e520jnXbKQXswLIl/sUoqk9tM5Ywx7+YM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rGKAm9YM05JfkjqEC+JZZsSyyvyV0WFFP+lRgILFqGkp/x4jejWG/gis5o/XdgV4N8erW6sbWD4Dgn72QnGdOgV9RFZn00YOcGg5CcSPLzyEQUo/0ONbXTYpb9mlboO/6PodH7wrw8vf84Od4Avy6lpurNUdCQ4RerzCZoup8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKBB+g6Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43191F000E9;
	Thu, 18 Jun 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781780510;
	bh=6lOViM8XZw8IyXWySCnmvDdUeVR9stpYQ3Laie40P4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BKBB+g6QeeXwV4RmUoy7LRLlpVYEI3/ZkwZdB5cmwLC3NmyiyxCCvVwzgJsoUzWZ2
	 Bnl/3zWJb3vjNLPJxP4Uw70q63wN3YxJV3TRRSPXcKDq/Q8N6MjGoXVF0dez7iLfdr
	 W2xpw/7DOT0HdrnaqyelYT+guKFt2z0yoOUpiSJ12GDUYoMsW9Hnzit6ACoxmKZ8dd
	 0HEP8ciDo5qQ2Clav84Lncnzlcts5KfORdN8U8UQOeV4ZaI0yJ2Gkh7JQPqEHpq8sC
	 Z+fM0ZM/BWbFxjhOHIqFZLp7qmbqGfIP9wVT2ZgbwmMaCdIcR+nms9CktE8TEp4jN/
	 B3q5Rea3IUGZA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>, 
 kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, 
 Chengfeng Ye <dg573847474@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Lunn <andrew@lunn.ch>, mike.marciniszyn@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 netdev@vger.kernel.org
In-Reply-To: <20260520200337.204431-2-mike.marciniszyn@gmail.com>
References: <20260520200337.204431-2-mike.marciniszyn@gmail.com>
Subject: Re: (subset) [PATCH net-next 1/3] leds: trigger: netdev: Extend
 speeds up to 100G
Message-Id: <178178050564.2049455.9807019430641335671.b4-ty@b4>
Date: Thu, 18 Jun 2026 12:01:45 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:kernel-team@meta.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:daniel@makrotopia.org,m:kees@kernel.org,m:horms@kernel.org,m:dimitri.daskalakis1@gmail.com,m:jacob.e.keller@intel.com,m:lee@trager.us,m:mohsin.bashr@gmail.com,m:alok.a.tiwari@oracle.com,m:dg573847474@gmail.com,m:andriy.shevchenko@linux.intel.com,m:andrew@lunn.ch,m:mike.marciniszyn@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:dimitridaskalakis1@gmail.com,m:mohsinbashr@gmail.com,m:mikemarciniszyn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8657-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-leds@vger.kernel.org:query timed out];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A705169F955

On Wed, 20 May 2026 16:03:35 -0400, mike.marciniszyn@gmail.com wrote:
> Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.

Applied, thanks!

[1/3] leds: trigger: netdev: Extend speeds up to 100G
      commit: bbd8b5bdb88bf15006b078f6a2a3b452ffaa10b4

--
Lee Jones [李琼斯]


