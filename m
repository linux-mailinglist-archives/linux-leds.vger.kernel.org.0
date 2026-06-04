Return-Path: <linux-leds+bounces-8486-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RSAzFnHuIWqvQgEAu9opvQ
	(envelope-from <linux-leds+bounces-8486-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 23:30:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0636439C9
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 23:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KVvFxAn2;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8486-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8486-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FC553009E2B
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 21:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B903D9043;
	Thu,  4 Jun 2026 21:30:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE83E9F61;
	Thu,  4 Jun 2026 21:30:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608620; cv=none; b=hnCf5fbLBHiAsm9r44ArFjF6sVO+ZM+KqcJcpbp89+Is04mJ9TDIVgK2K4loMxcfG0rTrC1m3CO4L+jkxStZVXg1wsmK1kEKTrCvgGNrl9XasWemRlmu5LMY6aCBo3M34Ty+Z686blnIjim3KR16HR0BXELeA84kPaHgMOvKtxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608620; c=relaxed/simple;
	bh=ou5f4RNsO/qt4RFvA8bM/Q80qO7tC8SqRKNrn7v8KJQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=O/6wDsbRr4qQ5dQ+Tf72xY3EZxiajOlgE2o2eRrM2WwwHwgYAih3x/Jen61DT4yav/5P9uzt9njmcsmQVQCK/9u669DTBdw2bF6tvWPeKrpv5groEmUBkan1YIvAbTBbKVdOkUl7wYdmwvwAnQDlS2FjyKNoSgDH1FJTwFS/W1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVvFxAn2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D1F1F00893;
	Thu,  4 Jun 2026 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780608618;
	bh=9lWxlO6ntsyiC++b0Cvnh+whTMYhM2EFtDyY/PQSpn4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KVvFxAn2zLpyRY90s29gWWmC7a02XJOYPYW+OzXGsH8xwGI7zvWrSj7kZNLSu+wDc
	 zkqkDTbhv+WUVKP2iEgUNljK90NmxFKEjZVUUQ+iPDyNgJ+hg0Rswsz7/cnfJjIVLP
	 NrzOLLFr3/IGOgnyHbPEay7u+7rwI7yaes3gJ/MpEGbkcPWunEJyMuJd6pKkumsp+E
	 yzProC7XEZSob7tjGWkQGylvGNkJ7OLlTjXb1ndc4o7t8q4f+l5qD5JqgMZLlq7cpy
	 dAWE0cFiNBC6OO8ukRjzcQVU0l0SmNB0bjcZsYkxQfYeoA/iRHejtP7NNWJNUM2n6e
	 NEYEuBXXNjG0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09453930A28;
	Thu,  4 Jun 2026 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/11] net: ethtool: make sure
 __ethtool_get_link_ksettings() is ops-locked
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178060861965.3031243.13905126660213599412.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 21:30:19 +0000
References: <20260603012840.2254293-1-kuba@kernel.org>
In-Reply-To: <20260603012840.2254293-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, nb@tipi-net.de,
 lee@kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org,
 jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com,
 vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org,
 hare@suse.de, jhasan@marvell.com, danieller@nvidia.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8486-lists,linux-leds=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D0636439C9

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Jun 2026 18:28:29 -0700 you wrote:
> This is prep for the series which will make most of the ethtool ops
> run without rtnl_lock. The AI bots surfaced a number of callers of
> __ethtool_get_link_ksettings() which need fixing, so I decided to
> send that as a smaller prep-series. Each driver changed separately
> for ease of review.
> 
> Full series unlocking ethtool ops AKA v1::
> https://lore.kernel.org/20260528231637.251822-1-kuba@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: rename netdev_ops_assert_locked()
    https://git.kernel.org/netdev/net-next/c/251bc9db88fb
  - [net-next,v2,02/11] net: ethtool: cmis_cdb: hold instance lock for ops locked devices
    https://git.kernel.org/netdev/net-next/c/1d3964e29e53
  - [net-next,v2,03/11] net: document NETDEV_CHANGENAME as ops locked
    https://git.kernel.org/netdev/net-next/c/b8dfa196cb97
  - [net-next,v2,04/11] net: ethtool: add netif_get_link_ksettings() for correct ops-locked use
    https://git.kernel.org/netdev/net-next/c/f32fe1d79a18
  - [net-next,v2,05/11] net: bonding: don't recurse on the slave's netdev ops lock
    https://git.kernel.org/netdev/net-next/c/107b097790e9
  - [net-next,v2,06/11] net: team: don't recurse on the port's netdev ops lock
    https://git.kernel.org/netdev/net-next/c/a6882c158326
  - [net-next,v2,07/11] net: bridge: don't recurse on the port's netdev ops lock
    https://git.kernel.org/netdev/net-next/c/20398c41d001
  - [net-next,v2,08/11] net: sched: don't recurse on the netdev ops lock in qdiscs
    https://git.kernel.org/netdev/net-next/c/e50f6245be53
  - [net-next,v2,09/11] leds: trigger: netdev: don't recurse on the netdev ops lock
    https://git.kernel.org/netdev/net-next/c/ea8ea212d415
  - [net-next,v2,10/11] scsi: fcoe: don't recurse on the netdev's ops lock
    https://git.kernel.org/netdev/net-next/c/af1737dab07c
  - [net-next,v2,11/11] net: ethtool: make sure __ethtool_get_link_ksettings() is ops-locked
    https://git.kernel.org/netdev/net-next/c/9f275c2e9020

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



