Return-Path: <linux-leds+bounces-858-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CF85A533
	for <lists+linux-leds@lfdr.de>; Mon, 19 Feb 2024 14:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61744B213A0
	for <lists+linux-leds@lfdr.de>; Mon, 19 Feb 2024 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8B5364C6;
	Mon, 19 Feb 2024 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIbnSRxM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57836364BF;
	Mon, 19 Feb 2024 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351055; cv=none; b=CEqzqPOoIY8q63CkbPaa8SQAK7SsIDPray5+O0vOjBB83pvYjc/m3OBGvyVp6tsnCUbd8GlD/eQfbLXAiXbafAXUM7L0+UjTCoL+k99t5gVWYSul16fL5kG0lvxOc6xEw6w1Is8k+9F/BiI+ozAgwmegYxUbb+cDOo2wlrsi+M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351055; c=relaxed/simple;
	bh=xkSTX1FRQU9V6Xn/Nnjvn9NmdWAvnaPJ1jvuYradFbI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M66jhfLOabnRXwUaZBobC/OyIrmHSML6TzFCuMscQd8NzPE3yWyI3EsElEuXlzdyaPuSsGgVkd/AUbWdm0LxigIrkfMcYAM97hxn2rfD5lU4tnwxZ1dsejLpYQH0kkWnnd5RwHQvjDls3Iixk1V6AGBqmTjiwwzOPTAxi/qG/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIbnSRxM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708351054; x=1739887054;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xkSTX1FRQU9V6Xn/Nnjvn9NmdWAvnaPJ1jvuYradFbI=;
  b=IIbnSRxMlJvli0nIw9KhxHmQ5BEqEw7FyDCOIu0oIS842JbxPzTHI7SJ
   AyTJOzdixYyfcxd4vSfx4CPQihoQC5RRypJfgnw9DTUPutB69eCtk0sTx
   lX51ixcINzQ67qKSr/1h8eIAN1lLKERdvudQ/DmGaNYJllK1q7RDckEvI
   fqK6Ofwek7VPpS6/Za/udu7CfsLXKIij81OGnsuk3IJ6zZZlmivW7RKt0
   RBwlDrCWGR+61UnLS92HnsWeO8ghKc3+X2KV5o1OSusr6XDQnaDrVOx9A
   WoouWMtYPpBWXPVavkPZiNswyxl0A2PotKP137WQ6Rkte+8VnQSg6QCeE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="6206163"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="6206163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 05:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4861005"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 05:57:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Feb 2024 15:57:24 +0200 (EET)
To: Kate Hsuan <hpa@redhat.com>
cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
    linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>
Subject: Re: [PATCH v2 0/3] KTD2026 indicator LED for X86 Xiaomi Pad2
In-Reply-To: <20240216160526.235594-1-hpa@redhat.com>
Message-ID: <2dd3ead1-1066-3564-7c6b-9d366dc6e1e9@linux.intel.com>
References: <20240216160526.235594-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Feb 2024, Kate Hsuan wrote:

> The v2 patch includes:
> 1. Typo and style fixes.
> 2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
>    KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
>    sleep can be removed when removing the module.
> 
> Kate Hsuan (3):
>   platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
>     indicator LED
>   leds: rgb: leds-ktd202x: Get device properties through fwnode to
>     support ACPI
>   leds: rgb: leds-ktd202x: Skip requlator settings for Xiaomi pad2

So what's the expectation here? I take the first patch and the two other 
go through the LED subsys?

-- 
 i.


