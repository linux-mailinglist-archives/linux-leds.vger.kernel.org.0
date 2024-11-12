Return-Path: <linux-leds+bounces-3401-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE79C5EC1
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 18:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2EF1F2366C
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 17:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3942003D6;
	Tue, 12 Nov 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo9VjLh9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7F189B8A;
	Tue, 12 Nov 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432083; cv=none; b=GpGtulww+GLQTYh1AnCMd9hgoYiatjmsvoWigkwGIGeDTOUtCkhG2Ej5H94m4Q34YgnQt9/OFuxSLE2Ex29eYdxcEtMYFxnj/rhZ71SsyDosuyLidg4xTrMFKT6vv7NrlRvWnFDRSLcAO+3ApIsuz+uKdSa8eXufFXYk95er19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432083; c=relaxed/simple;
	bh=/JtKb7FsaOVou3htAjGvssb9aR32wpE0fEKW7R5DMBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEKhSYgkDcq3dzDnqVhsos9OtfJwOm9d+n4uUh7P1lihYUAcBDDz2lKOtZdBs+byDShN/ZPez/gbozARM4QTLK48FNSNNC9djOxaUqmVs2zC1TnkahVn2z9rFaltSsbftgfNp4+BaZo4aQl1jhjvHS7KBuL71pkfK1sawFM/ssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo9VjLh9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471F5C4CECD;
	Tue, 12 Nov 2024 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731432083;
	bh=/JtKb7FsaOVou3htAjGvssb9aR32wpE0fEKW7R5DMBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yo9VjLh9VZGV6qPubc2gsu+bPK03Nw6Fp71YV185k19ZTTHTDtMJLr1paLZvoIAO4
	 R6kKwhRSF0mkBt8gnOSMX/n9nkqVlUz22B/vxCyMRoRFjQeUYEZXaLqeoW1gdfEOz9
	 x1bNH9N/XEFWs3CUnT+MFDZcFfb5/gLY3Mx0fqHMR3yd4bm68xj1ToY5tn9NkayKE7
	 tEmlUWwk4eTTxQLUrOyTFmHPazGl6G0F07fmvcRm8VQ2yzlwypdyDK7NKVgyGqzffx
	 w05iG1YOs7XN5UpEHaua+g9iRlTK3bJwyR6wMGUdm5kemQxeLRZavL0bCnMImDcHHf
	 joi6dWyGzEH8g==
Date: Tue, 12 Nov 2024 11:21:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-leds@vger.kernel.org, Fenglin Wu <quic_fenglinw@quicinc.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add pm660l
 compatible
Message-ID: <173143208072.1365750.10688609238642608606.robh@kernel.org>
References: <20241112024050.669578-6-mailingradian@gmail.com>
 <20241112024050.669578-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112024050.669578-7-mailingradian@gmail.com>


On Mon, 11 Nov 2024 21:40:52 -0500, Richard Acayan wrote:
> Add the compatible for the flash LED controller on the PM660L PMIC.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


