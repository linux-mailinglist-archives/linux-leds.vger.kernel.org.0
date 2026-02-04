Return-Path: <linux-leds+bounces-6836-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGToID8og2kxigMAu9opvQ
	(envelope-from <linux-leds+bounces-6836-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Feb 2026 12:06:39 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E5E4E7B
	for <lists+linux-leds@lfdr.de>; Wed, 04 Feb 2026 12:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B69963004D86
	for <lists+linux-leds@lfdr.de>; Wed,  4 Feb 2026 11:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D2C3E8C72;
	Wed,  4 Feb 2026 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO3GjapM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508D3E8C41;
	Wed,  4 Feb 2026 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203152; cv=none; b=b6ukN5VE0MEOICvJLxe6sQcmrhiOo/CUhRGTfLS0QPVdrl0gAvoUTAlvV2wDWmINSU6Tn96LiMrBB4jz/2cg08VL6i6Wzg1PQL01VMQqNrpmlvuZqokqRUSFF8MSo8zOFAp2NKDRUinDbeKiBrNk7Yj5Kgq5XH1GsqFrcBjPEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203152; c=relaxed/simple;
	bh=PkJXOl4pp02hirI3pGXy7PZHHpLf4/Xhx/t+MrNESb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tmheYzHn0CfUx5KyRtqWoS6x16JDYHPLKxtMfdYx9nmEFFeP9JsQG7NKYcrfrpTpjviYuFt7BSUFAzS0mE6YjH0Tr1rj5atkWRBZutId/ptoeh31UQSss+Ga+99kuNqXBhvYTuw89ocb/sbNJ0duMprSO5Vxqy5fygtvLIRK/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO3GjapM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29349C16AAE;
	Wed,  4 Feb 2026 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203152;
	bh=PkJXOl4pp02hirI3pGXy7PZHHpLf4/Xhx/t+MrNESb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nO3GjapMR4doY0/K5HOC5jv8A/x/cZyuu7jd6PY2YHlpRlahyp42uKsVxoHLtC7p6
	 EHMzcyCKMGE5wLFzkffwZu3K0v3pKk+Hi27S1qQD8R6tjbZ8accr3gQmQOP4A2R1Pe
	 pHsAS8UxgUUeGbouGRxlmNFBbDxvWJhJE50QwBjYuUcXx0IOmUJgW5mGEP8WwRUhRK
	 G/z8rAveMf4anQrUHb3w9DXnO1qzkm/Ujlhfd3HTw1c27H175U+Rbt0/l+fnBD9VB+
	 oiGEnCcsSvvlr4VamA4lSydTSqoigQRcuB+2Qtjx96bJO7rK6q/zW8r/PEGpUAb4LG
	 +mebSCOhvNl1g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121235746.370607-1-robh@kernel.org>
References: <20260121235746.370607-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: Convert ti,lm3697 to DT
 schema
Message-Id: <177020314988.1159995.7748487141446466712.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:05:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6836-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC0E5E4E7B
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 17:57:45 -0600, Rob Herring (Arm) wrote:
> Convert the TI LM3697 LED driver binding to DT schema format. It's a
> straight-forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: Convert ti,lm3697 to DT schema
      commit: b2c87f5e98cd88095dbc6802197526703d5e4e48

--
Lee Jones [李琼斯]


