Return-Path: <linux-leds+bounces-3707-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8C9FCCCF
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2024 19:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7131881AB6
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2024 18:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0031DD0E7;
	Thu, 26 Dec 2024 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7eqAtC1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B61DCB2D;
	Thu, 26 Dec 2024 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237651; cv=none; b=h7CS0ruIyhycJSYBT2ULH4/qP+tfAHaWa9RuTshN7rPBr9vnRqg/F5+iyP79QT8UwKR71vD/MZQMRjuezBKCgIetgw2mzGosuu2kPIb+KIiSG/mJo1H37RuViQfm1OxkXpvUnDpE4sejXjhz1gysdTKS0VGMYRk+o2s1+TNEZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237651; c=relaxed/simple;
	bh=is0teGi7eIaTkFxCOrgu8fA/t9r9uioKAcL0hF0oUmw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cq2grXOfAroF5KB+kbeQObSkR9l2N7GQWbfGrCJGpQ8WPtFnRyQWfWr/ki2pu8WF+AIEkSFmSn2yZ0+d3QErVPo7zDLxHbjhMmqNl7WAlr3RcnuyJDbzOFJEiPLq4B/GtSJ3GA1HhpNKarZj+cO8AOJTUPahNa63AZZjNs+D848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7eqAtC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99A8C4CEDD;
	Thu, 26 Dec 2024 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237650;
	bh=is0teGi7eIaTkFxCOrgu8fA/t9r9uioKAcL0hF0oUmw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P7eqAtC12I31MA3gqr4rRhswpRT9rasSF2bV8VBE5BXU+dnNOKDiS+60ns0MAdhX0
	 4i+H/6J7qMVbcEXZJW3R2OjgucPibtKympZnTSzMsCmGwtLi+Z08mEsE1S1gddH3yG
	 EfX+sEGc3vdUog6BQQFSFysORryRUY3s6ct7jUUQzIcrvRXtHotDoJaUDq9BSbjoAW
	 rZepvkhVphFusduCkzk/fpH5e0no3f+NzB6pbCM/dFO1BmrnCRN4XnVxthxB9+OsPW
	 CsTxO+Qz6ScYC2Z6sp4mu12xMxOWSXZhrASBnE8KdsDvS8miPycVMOQSJAjPR19f75
	 epwi36pwr91WQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: Pixel 3a Flash LEDs
Date: Thu, 26 Dec 2024 12:26:48 -0600
Message-ID: <173523761389.1412574.10392484276633722098.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241112024050.669578-6-mailingradian@gmail.com>
References: <20241112024050.669578-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Nov 2024 21:40:51 -0500, Richard Acayan wrote:
> This adds support for the flash LEDs on PM660L and enables it on the
> Pixel 3a as an initial user.
> 
> Richard Acayan (3):
>   dt-bindings: leds: qcom,spmi-flash-led: add pm660l compatible
>   arm64: dts: qcom: pm660l: add flash leds
>   arm64: dts: qcom: sdm670-google-sargo: add flash leds
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: pm660l: add flash leds
      commit: 9b2955bae7025190c8d15983b37554da96e43e21
[3/3] arm64: dts: qcom: sdm670-google-sargo: add flash leds
      commit: 44d2a252698effd2f247a31492c10e1290903474

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

