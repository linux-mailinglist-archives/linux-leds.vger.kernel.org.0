Return-Path: <linux-leds+bounces-221-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39848800739
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733291C20A8B
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 09:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D871DA2D;
	Fri,  1 Dec 2023 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jN+EBoBw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673421D6AA;
	Fri,  1 Dec 2023 09:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3238C433C8;
	Fri,  1 Dec 2023 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701423491;
	bh=1sFqvuT/UoI9Gn2AZFl8jIGRwWG68Rvg+NmKuILk70I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jN+EBoBwdHQdiTvQDMX0gerZBPBH50mhnEQwVe2XJ77WHzpLpMcn5P9BdKJ332EH4
	 Z385f7rliDEUxgEctLD7+DTSHcsKTSvKMSPUavE0QnNTklojJR4LReKTm1OKY5cF/N
	 MGPWeQyYo65+sCUA4MwoO5meq9WONi4G1UV1HjNkYUMS0amEGp3U+GEzPDEIJgcHdz
	 FThp/tXh0g7KwK4SKICT4hntJzSqLVxD/XabCLghTl3GTvQq3f+ZjykcJCdJ8a90An
	 2CbM6jPQVZU+FLr/QWNJ3dHuAlmj8K4BfZt0c4bEM2065ioI+UI/RIHyu7qTdC5fKs
	 a3avuVVtqVXwA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r8zyx-0003Hq-0d;
	Fri, 01 Dec 2023 10:38:47 +0100
Date: Fri, 1 Dec 2023 10:38:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, inux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: qcom,spmi-flash-led: fix example node
 name
Message-ID: <ZWmpp4Va5Xn1iC6J@hovoldconsulting.com>
References: <20231130171940.12391-1-johan+linaro@kernel.org>
 <eddf541d-e505-457f-9363-f5e96885ee25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eddf541d-e505-457f-9363-f5e96885ee25@linaro.org>

On Fri, Dec 01, 2023 at 09:42:02AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2023 18:19, Johan Hovold wrote:
> > The led controller is a child of an SPMI PMIC, which in turn sits on an
> > SPMI bus.
> > 
> > While at it, add some newline separators to improve readability.
> > 
> > Fixes: 1aeff6216891 ("dt-bindings: leds: Add QCOM flash LED controller")
> 
> Nothing to fix here, just an example code.

I'll just refer to my reply here for completeness:

	https://lore.kernel.org/all/ZWmn6uicNIqqSwoE@hovoldconsulting.com/

Johan

