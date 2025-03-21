Return-Path: <linux-leds+bounces-4336-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D7A6B816
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B283BA108
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7229D1F1301;
	Fri, 21 Mar 2025 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSBPe7QP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C81F03D3;
	Fri, 21 Mar 2025 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550624; cv=none; b=QjIoGTIpWCZUFro2H6rZ8JRiU6NSvZ7zoChnSksqTE+V8n2AS7w+iKmdYfD5hpjaNM86ghAqZNH4xcfMwvlJ4qHxlgxxGGN3DqqjOZpDVZsrfxS8t3GXEkcCMreY50S8ZAa7N2Pox98ocqDYYIrMfaYXTyHkrRzL2CRQ8cRNuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550624; c=relaxed/simple;
	bh=gyDlfWyw1771CXSq4GvN72QvdnZj6cGfMHu7biq0YSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mNCQf2V9SNGMiSqHzrRVOySaVcsSSl8NdVmwZIPaeuSKXw9xAce+eCTSxtSISWfhmlHSUWKGyVgaDMRTe/VL47+a3kHAfuEjCblELG9KgIHviCJRRZCv8fEdbtMPOVXNirguvKgPw3iwtl9AXZnvbXji44tYiMMDmP5ESCTGRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSBPe7QP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE6EC4CEE3;
	Fri, 21 Mar 2025 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550623;
	bh=gyDlfWyw1771CXSq4GvN72QvdnZj6cGfMHu7biq0YSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mSBPe7QPFJ32et74QWsoniKon5gTyXRuxpfPEtdVVn6nMYfsHp+OzgdIzYIvizbtC
	 nqzLZWeLkZ1FNtS2Tuba1PSnuQ0fnBSo79GjDTN6iKYbI2BzX4Ymm1vAOECxpX+imr
	 /S/KZUEnW/Xk/0hTgES6aQrccv0dZlS5Fa9jukG2HV437ju7DiripK3XR9WaBshCVU
	 TYf+wFW/GNj4Ky65b+Tf0MJkZcvL007bBh00o4G9+Y/CKZhBENxM89//nniZ/DPNf+
	 lnjMFgQo4aztnkLQOY5L6VgvLPaK71DH5aM2eyjPgtDY9m+9PcIyatr4cAtK+iWfsk
	 aWuQ78Vwb8S8w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, George Stark <gnstark@salutedevices.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>
In-Reply-To: <20250313161630.415515-1-andriy.shevchenko@linux.intel.com>
References: <20250313161630.415515-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: nic78bx: tidy up ACPI ID table
Message-Id: <174255062238.2018594.6916976411688982293.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 09:50:22 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 13 Mar 2025 18:16:30 +0200, Andy Shevchenko wrote:
> Tidy up ACPI ID table:
> 
> - drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h and
>   other necessary headers
> 
> - remove explicit driver_data initializer
> 
> [...]

Applied, thanks!

[1/1] leds: nic78bx: tidy up ACPI ID table
      commit: 161e3bea8fa5ba34b2291e5cfeb3e533cf991613

--
Lee Jones [李琼斯]


