Return-Path: <linux-leds+bounces-7739-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EAMCX6h4GlukQAAu9opvQ
	(envelope-from <linux-leds+bounces-7739-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 10:44:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF140BBFE
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 10:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FF0A30616DA
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD973932E6;
	Thu, 16 Apr 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="octJ4uzb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029C8391E75;
	Thu, 16 Apr 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328872; cv=none; b=ohf3u9UpPe0IEatoOWHGlBAZ7Q12tJDGLP2i1xeFxWIbOv2oZYwwHLZTN4ujiJ0bs/NBsqk0axbu6mGBlqc4wuLihXj+6Tr1gYccTvCtDTln/f1/XSd4DEVAcVSutHnuQz1zdRRNJeXEZJVWG3OPP49Uoq7o1MSGW4BtjNIfI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328872; c=relaxed/simple;
	bh=GfqXt/wMT0iXCm/W4GFpDMmdmYvM8l6qUCpcwZHvo/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FssTb0iVa3m6WzyDPRuvgr7RcP/ZYttGYmj8CfVecHOnbqS+i20EyH1fP5vJTLK/xN9GMriCeE1nYbBAv4uXFnkMDXx+I44TAvpeWC/riaghHWDtWY4AVZ4eO2Cw02uxLIAchOzynXRXJc4Z5s11AQf4+WNfoyPmYckCCgBU0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=octJ4uzb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5C5C2BCAF;
	Thu, 16 Apr 2026 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776328871;
	bh=GfqXt/wMT0iXCm/W4GFpDMmdmYvM8l6qUCpcwZHvo/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=octJ4uzbc6dTUSD36wzgHeDgVT9NDJcbvn1xU6VfAHVHEB5B4Gw8sTRgJe1JonsYz
	 wkajWS3awphY9PFlV8AI/QmqKCgVekwLDGycgKx9MTMwUoD31XaTujQOEQEek8tRBb
	 nKng748kEzR8PJKXrcmBdwTRMR7LXua0VELrc30yuVS7axU2Y1IkgN1kJky5aWfZ1S
	 5xi1lOnuIP0wqUskeXHFx/Vv4ukuWnXz7i80yShGqpPB5HOV4Zh1GojxTQOIuvZX57
	 F/Ii40Q60wafCVzBGIUlegoIjLo+e+KFRaKfHWm5JMTmwbN238AfsSYgf0100rZOq7
	 ek7FldYYPYkxw==
Date: Thu, 16 Apr 2026 10:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Message-ID: <20260416-radiant-active-caracara-e2e410@quoll>
References: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
 <20260416-upstream-ltc3208-v4-1-3884ed3e49f5@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416-upstream-ltc3208-v4-1-3884ed3e49f5@analog.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7739-lists,linux-leds=lfdr.de];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCBF140BBFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 10:39:06AM +0800, Jan Carlo Roleda wrote:
> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 188 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


