Return-Path: <linux-leds+bounces-3508-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDDB9E780A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 19:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E3216595C
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F88203D4C;
	Fri,  6 Dec 2024 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl5mKPRJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF81194120;
	Fri,  6 Dec 2024 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733509528; cv=none; b=GvPG8BNep+us+TVt3bSRSm33IJHTa3xsFZrmdA35ohVRXUSYWVYkMLhMgku8uQHP8F+MgewS8moBQcxch5Ow5zGbp4/MKxnsgXCaDdlPLK6ev5PCxsSby/r2gMT87o4mJ/h0OvpGXZ5r9WZ+Lt/G3TnOMu09itg3n+6Qg+KNjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733509528; c=relaxed/simple;
	bh=6zPrOx2SudmgD/c40+Z4a9ztiOiUIdAL08zqV81/sfs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LTIDzc97gKVkdMfFSz4T4gExWgxGcaC/h6q/iwihELLpk36t9CQVg1PL3N6Qpg3Q7C7TvGsomkHifdzmo5w3GfrOAMFRSZozxpnS24fTi8LN2ivotySkYx7KLuuGUqU3zSrVeziXq/uYqkQUnVo5zz63TkxccpGWWjB4gjIXqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl5mKPRJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FBBC4CED1;
	Fri,  6 Dec 2024 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733509528;
	bh=6zPrOx2SudmgD/c40+Z4a9ztiOiUIdAL08zqV81/sfs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tl5mKPRJ4qW6dAOX/AFyy4x6zWaRQy9Z/ra+AtEAYP1YS+8iNTK13pAz/lwHUFmuW
	 vkO18VAW3gT75101h1AAzL4GWebmnOzOPe/RZUwWSkKQsPssck0zqGUeRH3vQU64G4
	 0c+pwI61ZfzdDMUK+pur+1WXpU9i2vQiDL27LgnsflrBquDTI0N031EaWffY/x3z+G
	 Uscw4QpmECno6h5u2jkEw7vFHzL45uDGHBkpiGnVt8TPbdmC/hS/tV+3JIOcQ9Zykk
	 yKni9yZvcLdKsSbookP0Y5Omwi9ArnXRDmdyVX+u4bpc0kMVQW+enQNSLexJwbWOtH
	 N7edetiR57TsQ==
Date: Fri, 06 Dec 2024 12:25:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, 
 Hector Martin <marcan@marcan.st>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 asahi@lists.linux.dev, Sven Peter <sven@svenpeter.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, linux-fbdev@vger.kernel.org
To: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241206172735.4310-2-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
 <20241206172735.4310-2-towinchenmi@gmail.com>
Message-Id: <173350952667.3933863.13037602591337209524.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight


On Sat, 07 Dec 2024 01:24:33 +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241206172735.4310-2-towinchenmi@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


