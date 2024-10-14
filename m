Return-Path: <linux-leds+bounces-3086-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C199CD62
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2024 16:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D9A1C216C3
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2024 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5E14A614;
	Mon, 14 Oct 2024 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jPZKbhrr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC036B17
	for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2024 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916338; cv=none; b=RXsnlCj5PpxfTYQ0ECOE4kpf4WmjosB4jL7bTPI6UBIE7EJspXpaTRoqtvqEE5iDh0eyeaafGMg8dgh+kZPmxJJbyFBpQVVi1TbT61s/vLmk86ie4GsjZzaKLZ0ZK5QuUBxSRGmlyIRU07+DJr0D6vDRVrgLvs5EkmJ3R5VilOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916338; c=relaxed/simple;
	bh=zl8UFLW7Tkwq4TL+cGeNvFCZJyv3PKwLsnDSoE2Q6So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o981PcjV5/AU6MYOvfDZqdfGz6WfMJo4peRpSIh3KKaDFddXtVqQNL0FVOCFtuRthDdIFVkbGv4QWte+Yinrn032kP+i4RA4wqS0c2DPi0PYkMRvdBH1KC+Yhb+Mh8K5RisyqIFTbBmMIm4CyLKhlg0Z7/umyENUPqGg9pBbcrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jPZKbhrr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d47b38336so2656415f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2024 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728916335; x=1729521135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zl8UFLW7Tkwq4TL+cGeNvFCZJyv3PKwLsnDSoE2Q6So=;
        b=jPZKbhrrIBakJwx7D5c5jE9gE7N/m4Q7WOrVEROXKIuwK1PnCqVCUHdjOVscre4EAy
         0SEFi5wvG0EYMXzaWx9qBIh81bYjUVin2/xWgvkVaxVhp+J5WzjeLwBH9h8D6n1hp/q2
         jknj+c8gqa1bqtMzdCtlyaTB1VJhrqE+xTZHQ2iC0BVFc7+6CPmJAwyIqCnglozCdlkd
         e9qNIQeOLmGfvLkdXmh4qNXtH17XNEVluvZ53EeOwmPGH1/Fd0BW5F3bh7MJpf8ZpZMn
         tQXVLV0cnt+991HkopcGZzQNKwLkJ5SOtAj59I8aZsvXsFVOJuFqPtdlEr+bIZtcPhPW
         Yf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916335; x=1729521135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl8UFLW7Tkwq4TL+cGeNvFCZJyv3PKwLsnDSoE2Q6So=;
        b=rlH3Bc34wu+KA0/LtJ/bl3fBhdI2gvi1o/On4QC1LEi8fnxcRH5pCdZwkZFfpsv36p
         B042NS2NUflB7bvoBg5JSWo550B0P1aPU04hbaibUxn0E+U+iqeuCYZ0kjEKuad92QNd
         yMgY5wAqBl2KmR2flixvmQhhE9Rq6m/zEcfcf67YzqFpCYfcFNarc6Ntp3Y3fUgS9bFH
         JJ6Ir1O5VZNN7+PfDf8LzQ2gqzSXXM9ll+QFdhAFl2dq1ArFbgjUjPohBSUY40qrbriS
         oX9IDC5CQsKDvLz/OIcd4rkVK0AcVwV7LlyOVlHRzBwLztCyCyyntMOp4yyXl3mbxtov
         izYw==
X-Forwarded-Encrypted: i=1; AJvYcCVIkqq8lIViDAdFkIOoOMjUQZ5zslkRWMvMfb6HG8z4qNBAXYgP4BtkO9u0qFsMDAY8PNq9/1ANdyTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwnItfBuwAyqigtmsQvb39jJr5qH9bPDpwGBO+ZcGkmMlXgoMdA
	tNWglcVgtPlU/BvNxIwp5cF7TzOgkg0/ahPnohlblgFeXozh8Flgm2VTn+084kE=
X-Google-Smtp-Source: AGHT+IE3w9OgnIs5ktJA45Iy0OYC2gnGhc4/sWHDLgg9MLsz7ESBtRvhqpqzssEm3UrgKqkaey1GKA==
X-Received: by 2002:a05:6000:110e:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-37d552fe2famr7213141f8f.41.1728916335269;
        Mon, 14 Oct 2024 07:32:15 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8ac3sm11464781f8f.3.2024.10.14.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:32:14 -0700 (PDT)
Date: Mon, 14 Oct 2024 15:32:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241014143212.GA97798@aspen.lan>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>

On Thu, Oct 10, 2024 at 11:42:39AM -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

