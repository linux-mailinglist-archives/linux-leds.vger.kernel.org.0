Return-Path: <linux-leds+bounces-4492-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2780A90D25
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 22:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7920B179F1B
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 20:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C3722538F;
	Wed, 16 Apr 2025 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGEOJyqU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA8217657;
	Wed, 16 Apr 2025 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835341; cv=none; b=Rsg85jwMweNhw31b7XBKPu9Ka1ShLKiYqvrbrbZfw8lL//+uWhA6Fiie9eDuZoFRSr7bmFuTu5IvviQs6yjn4uYNyVTQfdm/2CCHmeknL5s7fyfaCCJnWTH3jEa/yJgFqqQwwrzkLku4GqtX7CP5w67bWbymxOQS0JQ8MEDIOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835341; c=relaxed/simple;
	bh=olh5zWLQlvOARfiL6LVnt5POpCWHhONm64CLOfODiW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7n/+gmvalNpsJWxkdjXek6pbHLH45OzslzLWcsHpWUbrdv9knQQCCuicIfTKnX5xH/mudIIO5KjckmmF+WsbPz734X67bBt8vDd/FweoC9qo6zfzgjZ4UgGayktugSWrxv4ZE1gkBedfPVLqaCmiG4GGbbYvrpTW/rcRaB7tV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGEOJyqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CCC4CEE2;
	Wed, 16 Apr 2025 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835340;
	bh=olh5zWLQlvOARfiL6LVnt5POpCWHhONm64CLOfODiW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGEOJyqUM5d2bCDOWGpshoNxJ9AClt18sbuP7WSDiM1mHLyp705IDkRH3yQMShBc+
	 ehDMrPSxtD2+sqMvioXwVThNoc+BM72vBjWrVy9uYQqb8CqEpfgWopsrzgK6btTsjk
	 VwJfIjamecPeMMbCycLEKJnqazdVdsbIdngwPW1+auI/GLLDFR8qghKQIiKTffUAHE
	 VKCqKiRbfvEFkl6cx6xB6EpC3Tjrt2trcoNLzQGnLg9ddLnd9xKNbjp9PeLzEGpGOH
	 ns2ttCTEpibfcO2mawSsD+m8NLrOQzAgdyuZXRxFFvefC7Cv0ntsBxHOPGo6vz+xTF
	 g2vXKldiG6/sA==
Date: Wed, 16 Apr 2025 15:28:58 -0500
From: Rob Herring <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: backlight: add TI LP8864/LP8866
 LED-backlight drivers
Message-ID: <20250416202858.GA3838008-robh@kernel.org>
References: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
 <20241218210829.73191-2-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218210829.73191-2-alexander.sverdlin@siemens.com>

On Wed, Dec 18, 2024 at 10:08:26PM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add bindings for Texas Instruments' LP8864/LP8866 LED-backlight drivers.
> Note that multiple channels in these models are used for load-balancing and
> brightness is controlled gobally, so from a user perspective it's only one
> LED.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> v5: no changes
> v4: no changes
> v3: no changes
> v2: ti,8860 has been decoupled from this series and converted to YAML separately
> 
>  .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

Applied as it seems this was missed by Lee.

In the future, you can resend without my ack/review tag and ask me to 
apply if something gets missed.

Rob

