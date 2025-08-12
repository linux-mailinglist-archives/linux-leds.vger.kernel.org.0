Return-Path: <linux-leds+bounces-5222-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D395B22E1A
	for <lists+linux-leds@lfdr.de>; Tue, 12 Aug 2025 18:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1722562170F
	for <lists+linux-leds@lfdr.de>; Tue, 12 Aug 2025 16:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FBB2FD1C1;
	Tue, 12 Aug 2025 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSpQX7Xq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCB2FA0EA;
	Tue, 12 Aug 2025 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016892; cv=none; b=L0oNVGaPJ4Mwos2iY2SpMxMVBC3qa/3S66LKcEVqPk//o5SuE22nHhGyLmEkwdM0/FzdoXHd3Ujv9c9XWM/Acamz1ZTxRqv6TbwRgw8fyU+MoMD5gXhUWptL4fqBdBYw07xsQjcOOZ7SJVEwLxCitjSLnn3ULpGs/3E4kGZy+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016892; c=relaxed/simple;
	bh=RpDjRJiLb5VsAKP90NEwluXA2g+8CuZTXLDSu6vFNqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q18bxwQe5BzfV04rgUoDtqLL7HiioGHtFS1M7Sbsl8HrzRJdB2c6WmsO7iZumxS7DhyAkAPjG0DNPw1CA19CYcHBpCMiVGE/HiA+Ds1+BYnk86QS0MOy+mQMVIILu6MQx5PFqbWoptxaJttQth17Qyj0SVjvTKE+Yl46U4GvBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSpQX7Xq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4A5C4CEF1;
	Tue, 12 Aug 2025 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016891;
	bh=RpDjRJiLb5VsAKP90NEwluXA2g+8CuZTXLDSu6vFNqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sSpQX7Xqp3Ga/zn5ks20ncAR+XkGXgnA4nm1swQ99t9DNtzMQOHvN76Q19gay/zVQ
	 C2iEI3Ufb1kU58Ox0VUh/MrFNdKvSyHCTCS4s442NkDAcD4Ci99ML5WVRGfCtXszzn
	 7TdgajRF6rJQqnEauVPpNpRluXlM+Z3bAhEfq5KLRi8FyflnSY2ARCWVS+LYHxP6tm
	 VL2dXpiXliH+I+s8u6HK3mJiLqqnMvEdpr+IXHzOe51srWLJff6HgeGK6VmgkkUz0O
	 Yp6THY57GW3zSm7XUWmJ04nYK5O7WsVfaLZbv/ehptzPhnPsp9BtH7hk7+nmmU3NsP
	 RDlbB5ihTZ7jw==
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
Subject: Re: (subset) [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix
 duplicating dtschema
Message-Id: <175501688581.633310.2083661450340253592.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:11:25 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 11 Aug 2025 15:54:02 +0200, Krzysztof Kozlowski wrote:
> Resending because all dependencies are merged.
> 
> Please take individual patches via respective subsystems (phy, leds).
> 
> Previously:
> - Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema
      commit: 78a474b5a31a25e0a77e50df42be925f7cb575e6

Best regards,
-- 
~Vinod



