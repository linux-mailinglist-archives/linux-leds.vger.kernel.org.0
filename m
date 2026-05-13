Return-Path: <linux-leds+bounces-8095-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBjSE70IBWoMRwIAu9opvQ
	(envelope-from <linux-leds+bounces-8095-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 01:26:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45053BF9F
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 01:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45D05301024F
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 23:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D703B6BE4;
	Wed, 13 May 2026 23:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzRCoaHw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61DC379C5F;
	Wed, 13 May 2026 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714809; cv=none; b=OK5y3Dg19tIXXacGufmnlmwpXtzs4FEMy9kfymt+bPcSJpFPMqAOs6JNIZopu+dSfrMijXB/liytQ/U9ffxhDmprl8xtY6hu6LUXHA1/UYMofzuN9/GS3yC06dYJByW8hJsOfT9E32SQp++b0GhoA01PRZIkfTh84vrAZagLWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714809; c=relaxed/simple;
	bh=q3i21lJvhVy9opCji1T4ar4kNcI5PZwWn8BflTqdQ3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDv23wZqixtV/9R8P1v1uUNbtpdJob0zimuj7NDkk2Ye+beCcQcqOafyPV7JqiMgJTw5nfiwRil1SnL18KIv6WI59xlsHzWb/sHfuyTjGcHMzpVnKwX0ogn/dSCcnEcBn+8i0AJXl6KLww+yDGmec++q9WeXxvebgVvC6rcnuQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzRCoaHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0CEC19425;
	Wed, 13 May 2026 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714808;
	bh=q3i21lJvhVy9opCji1T4ar4kNcI5PZwWn8BflTqdQ3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzRCoaHwgfpMxXtV5i7hcsOfWpF4L1ft/Q9VIAyK5ZJzkTiS454hh2sAIGpggmoIS
	 B9j0knU5zEFe/qnB7P0JctaEghBvxW6W76RHLeddbrQ1CdZ6VYJDEjfnHpsZ/Qa8Th
	 jKP3jJrqVwoINxJbxqY10pEHStpSlELHor+xoC79qPymPpXbzTaIZB0WXChSoYmsPY
	 Lt10Kj5huXqpAvdKD88ox8f7uLKY9cVwUHH+ie6+argLgDZZDAugk3f902RWGX1eAN
	 dTnan5PrrRuN4doIBw1aRAoURp3Z/3JPBI3LxwY4jeWjo7vesG0WPAFL6SoEkvC7bB
	 1e87ClxSOCDqw==
Date: Wed, 13 May 2026 18:26:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Barker <paul.barker@sancloud.com>, Grant Feng <von81@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>, Lee Jones <lee@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Baruch Siach <baruch@tkos.co.il>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: leds: issi,is31fl319x: Add description
 for the shutdown-gpios property
Message-ID: <177871479468.2298897.389759358706715014.robh@kernel.org>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-2-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152435.21389-2-jerrysteve1101@gmail.com>
X-Rspamd-Queue-Id: BB45053BF9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8095-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,kernel.org,axis.com,sancloud.com,163.com,gmail.com,sartura.hr,mailoo.org,linaro.org,ucw.cz,arm.com,lists.infradead.org,bootlin.com,axentia.se,tkos.co.il];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 08 May 2026 23:24:18 +0800, Jun Yan wrote:
> The IS31FL319X series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown
> mode for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Add description for the shutdown down (SDB) pin and fix the example
> device tree binding.
> 
> Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


