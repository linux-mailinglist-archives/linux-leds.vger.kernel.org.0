Return-Path: <linux-leds+bounces-3588-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1609EF790
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 18:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F9C28DE18
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011D72253FE;
	Thu, 12 Dec 2024 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu+7bypM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB8223C65;
	Thu, 12 Dec 2024 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024887; cv=none; b=jvLws7iOWuVzykfDlw5w0CA8c6aREO19IWTvKo2FZ6HsbuE8aEe8F0fJCvKlgatYKFJyB0dqFk+S5biyXjG0lFCuFYofO9HDWFcoGVKQMpsqwx6PRVRY+e0z/+H8wSOEPeLjnJ/eOMdqnOqmUAG02V/aP0KGCNeAcUjkTaZfYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024887; c=relaxed/simple;
	bh=nuheu8CaSjVPInGlYWmSJX3qeuww5gIN44KXoiaL6h8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cJc/cLwV/DSAKEZR8OF3x7+VXuqUXFXY5vhQ32GXBenReRL5avef1vimRHdeS2orrpoiQXvwPRcsETGujz8uj/9aOtCDrqSP3UzsUjRPAvR5CTAkRtvnVfkCBhUrWPmfGs/mL0KaMc1p+hBOl5riftGlNO07IjhdtIfYb8M3574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu+7bypM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD6C4CED4;
	Thu, 12 Dec 2024 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024887;
	bh=nuheu8CaSjVPInGlYWmSJX3qeuww5gIN44KXoiaL6h8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cu+7bypMuIIt6nBC4oVgk4LmeiOUnOA9qVe/PrDX9e/KTr4ZKN5TMnh7V01F26SwD
	 6uQgrDymzBZh6QHpaoDoJ5tLPxxNNMcmMvoKu3VjpYY02QRRgnyipFgOY0vqKoj1m5
	 okVGr0BOhFdVPqlId16ojTxG2dFDwJp+r1zfhzoYqkJswgrPrJ5kDy3HUbubJkLbs/
	 6mq1+caYhYlhnzt19VZYfTEaK7lXzaZICh77ggaQbO5Esbu4rmsFBl29wv7sC0xBle
	 TRxkn5fGVdJhOMowgYgbfQ39Q9Gwl6m8NtxVe9SfzwiJb0HsOCcplS8elkaxI8C6XD
	 Hgk4bB0JyIaFw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20241112024050.669578-7-mailingradian@gmail.com>
References: <20241112024050.669578-6-mailingradian@gmail.com>
 <20241112024050.669578-7-mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led:
 add pm660l compatible
Message-Id: <173402488505.2243276.15738317227863868973.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 17:34:45 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 11 Nov 2024 21:40:52 -0500, Richard Acayan wrote:
> Add the compatible for the flash LED controller on the PM660L PMIC.
> 
> 

Applied, thanks!

[1/3] dt-bindings: leds: qcom,spmi-flash-led: add pm660l compatible
      commit: a1234b215538279c8520481f6d539f1582bd17d8

--
Lee Jones [李琼斯]


