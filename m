Return-Path: <linux-leds+bounces-8957-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KLKeHTP1TWrDAgIAu9opvQ
	(envelope-from <linux-leds+bounces-8957-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 08:58:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD88722679
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 08:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hY8HVSvH;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8957-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8957-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0593D3023A70
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 06:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD2A3E9C16;
	Wed,  8 Jul 2026 06:52:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3013E7BCB;
	Wed,  8 Jul 2026 06:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493548; cv=none; b=e05ozmrQyOr2bWveCtRMS49HURHoBs7h6oeT4oaR/NJa2X5K1WxbS/8693rqNWZ8XV5Ym8DHEaE9FxnB+K8myNPCRedFooMxmmdr7THuGBXYg4hZAWPC9J8lZz3Hbed1eNLPEckw+gCt3krtC81/rAyJS9WbhqOjQOPIPi6su1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493548; c=relaxed/simple;
	bh=3djQ3tHcVyYzfieWjRAjEiyq6obB7OXt9YpcPbqNfT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sjym0a/zljWYiwVnX1WUaVmhlj0h8BWlYaHmogZHxUEVB8qPvn5QjSLU0MY7ksI5m/lmOBDmmAEams3RLHoirYgwxFlQObILIZzFq+gT+A3phOC4yqzh7P8sAck8WM60jJrMNIYHZfhI2vGoXWEfZYCik4KdhhR0vC94723SgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY8HVSvH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20811F000E9;
	Wed,  8 Jul 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493534;
	bh=3mw2lzxSV792arv0MrgHyA7IiA/oQXRXMEHzQXGYThk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hY8HVSvHcaceE8FIKY+0wtHjKKT7Ct9mD64D1cee/1GQ3LSMMJLaIjTmX00f0fz+4
	 2XoZ/MMngoXER0qa+84aD7DX+6futRQLof8DrQtPA/F6QROyAKGeAcqsyUhg43RfW0
	 dVOUxXnL82zT1Btha/gTLl6FuvCqqZ5XshyOLYEqlIyQhwrvYcEhyuY/w57ZlV/4p+
	 GDW9G8SFvT/R7mYwn0dNUIJa4ws/WWQqahfRnbJAb1n38TB6dCCvUiHVutlbA8/29D
	 djiptmDm5x2q5+4Yiw45zVpJw78Bf4BKnyAPogK1HYoWug1wce5poDfGhbRvkmQo8N
	 9jgVD1ZzyGHfg==
Date: Wed, 8 Jul 2026 08:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, noltari@gmail.com, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Message-ID: <20260708-diligent-optimistic-locust-ef1e4c@quoll>
References: <20260707184437.500278-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707184437.500278-1-ninadnaik07@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ninadnaik07@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:noltari@gmail.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linux.dev,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8957-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.linux.dev,linuxfoundation.org,brighamcampbell.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FD88722679

On Wed, Jul 08, 2026 at 12:14:28AM +0530, Ninad Naik wrote:
> Convert the brcm,bcm6358 to DT schema.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
> Changes in v3:
> - Revert to unevaluatedProperties: false and drop explicitly listed
> standard LED properties.
> - Simplify regex by removing redundant 0| condition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


