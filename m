Return-Path: <linux-leds+bounces-7563-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EVmJx7vyGn4sQUAu9opvQ
	(envelope-from <linux-leds+bounces-7563-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 11:21:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4DA351550
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 11:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A33C8301AF7E
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 09:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC372E5B1B;
	Sun, 29 Mar 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q038+tBR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642C5285CB9;
	Sun, 29 Mar 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776089; cv=none; b=MMNDK8ig3bkngPBo71FklNvbxTxw9l6O/vTDF/93Z19a8O+4bq+VIdvWSfTh0JQ+/sLiC/KrAPkxNClsRbGuePzrD5DjzgbqYM77zye+dyknQGbq7N7OdaoqauEBI2VEAPbN4D6c7xqYdszOyLdAfNRLWipINy9THB0HlWyWOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776089; c=relaxed/simple;
	bh=krJksK73J683bs/CH1MzSlPSkGVGi1AHMRQNKlhYMdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhiQ7tU1q6OdWDtjcAD1+cMsFAR9SCPnJqn2Axltvm4Bo2ZEgMXAb2M5v6asYiVMILSX8IN1uzQ2fWW7s/iB0M/0ElXV1ABt7gpH5GhF6VnbVVTVK7v071t1lRvkyB3uNRKYokGyhn2r/XIUZ2+6Z8dZHgKQfRhHy1ZAnjoasV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q038+tBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55767C116C6;
	Sun, 29 Mar 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774776088;
	bh=krJksK73J683bs/CH1MzSlPSkGVGi1AHMRQNKlhYMdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q038+tBRK5+0+u/kvw4B0o/FUUEN428NhFw2xcDOKSmHlw+8URFARbzyxvF/xmm2l
	 +hrXAhx8OolB8s3zl+oBtzS1+02+rpvvUR4WaLIO0OJ/+3m0dYEIi87DOYQjv20Si1
	 xhxYxLDkID6jpklV8VNgpit5x8EsnwFRzyhOFV3azRsanMa4iDa2DKvhqjT31eSzwA
	 qMiZnBHhAEuDvLKPtVR08PpmOOh95LULWXR7YaFSoq0wWlJKnOTmL/t6wGg3bWrlle
	 nqiavS3gypEXPXpsJuex1vsr/0txyR+xpkQEK/kj8+ebllbJAKvuiZCcTqI6Uv8quM
	 0BAd1FjcMqoZQ==
Date: Sun, 29 Mar 2026 11:21:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-clk@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Message-ID: <20260329-amorphous-happy-deer-cea083@quoll>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-2-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-2-870e0745e55e@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7563-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A4DA351550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 04:47:57AM +0000, Biswapriyo Nath wrote:
> The '#reset-cells' property is permitted for the SM6125 SoC clock
> controllers, but not listed as a valid property.

Any reason why this binding file is the only dispcc not referencing
qcom,gcc.yaml? It should and it would solve the error. Look at other
files.

Best regards,
Krzysztof


