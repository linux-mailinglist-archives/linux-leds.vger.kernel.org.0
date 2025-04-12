Return-Path: <linux-leds+bounces-4466-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB3A86E54
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 19:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46141441EA4
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 17:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96202036EC;
	Sat, 12 Apr 2025 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsPugt83"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA541EBA07;
	Sat, 12 Apr 2025 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477958; cv=none; b=HEyhWmwFHiptze7c0PlhkTF2SU8kkWldLqs5kO6mZxOTG1OPO/Sc4gU75fYByGl50FXZPPSKsDNeQeIGV1Hdq8PWrmKWFiFpo4XisGkzg7JMDmUFQ+wY4ZgabGv1EiW9FGXaXQdUOSrw9Z/JIHjpZzRKUA51bDdSKwB2B90Ucgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477958; c=relaxed/simple;
	bh=YrGktRLoxIndoQ5EBLFpMKbRXSGz9qVyqaiXPao7YVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgVH5i6e/uo2A9vgcDvYj6sFJCuSUSqrQFttc9TghfKCU+afN/ZNWhnEMMYxSKcMEjvwxXMejrLVIF8OaRleDChVObBxQ8ZW//yyh2j4dPuo9LoNJMWRoZ69BXueUNZ6kXRBRwzAM782ObhYkCtt/zvf55SLdC3NKZDwGzMkpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsPugt83; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4905BC4AF09;
	Sat, 12 Apr 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477958;
	bh=YrGktRLoxIndoQ5EBLFpMKbRXSGz9qVyqaiXPao7YVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsPugt837K7SR+Kmb7nLMSoSYl6/So02pte6V304TcyW1xAuhnNcNaYRL9HGPoak1
	 PCKB/f+GsN/wg9bsNj/Z4tQsluN5J8qjn5mmn31ApvcgcLIGLTR6jEA12ap9MdEUYE
	 vEMJdIjesHxZA6GyaDsmfNO3xNvQB6W/q1pIUiHa0ghWXw0hwIc0hXD+4uvZRAY992
	 wkNVehePtbC8zMHnl1ktcg4pca96tNj07ngiCcI3WHnt3CooYQBAhyLqg1oHe06Na4
	 P+FixSYdlyxK5S/YeMl4jka7ZEFiL8bKX8r1lSBuo/e9DHW242c65sHOzHtlUmAHHH
	 +TlkMl0PZFdlg==
Date: Sat, 12 Apr 2025 12:12:37 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: leds: Allow differently named multicolor
 leds
Message-ID: <20250412171237.GA1347507-robh@kernel.org>
References: <20250412-multi-led-v2-1-56af86908744@posteo.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412-multi-led-v2-1-56af86908744@posteo.net>

On Sat, Apr 12, 2025 at 03:04:32PM +0200, J. Neuschäfer wrote:
> In some cases, for example when using multiple instances of
> leds-group-multicolor, a board may have multiple multi-leds which can't
> be distinguished by unit address. In such cases it should be possible to
> name them differently, for example multi-led-a and multi-led-b. This
> patch adds another node name pattern to leds-class-multicolor.yaml to
> allow such names.

Really, multi-led-0, multi-led-1, etc. would be preferred like we have 
in other places.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> V2:
> - Add Krzysztof's review tag
> - mention leds-group-multicolor in the commit message
> - rebase on 6.15-rc1
> 
> Link to v1: https://lore.kernel.org/r/20250209-multi-led-v1-1-5aebccbd2db7@posteo.net
> ---
>  Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index bb40bb9e036ee00e06d21e2321ecd5a7d471c408..c22af25b6430be71300c0e37f696cd61112ea190 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -21,7 +21,9 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^multi-led(@[0-9a-f])?$"
> +    oneOf:
> +      - pattern: "^multi-led(@[0-9a-f])?$"
> +      - pattern: "^multi-led-.*$"

Combine these:

'^multi-led(-.+|@[0-9a-f])?$'

oneOf is best avoided because the error messages aren't so great.

>  
>    color:
>      description: |
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250209-multi-led-9991e205befd
> 
> Best regards,
> -- 
> J. Neuschäfer <j.ne@posteo.net>
> 

