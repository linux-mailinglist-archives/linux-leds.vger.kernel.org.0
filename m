Return-Path: <linux-leds+bounces-6063-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7CC4670B
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 13:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 944403AE519
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 12:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B299F30E84B;
	Mon, 10 Nov 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9qI7CNx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393221772A;
	Mon, 10 Nov 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776054; cv=none; b=ne1Lk0wk9glQE7Pn+90TzY8qnb8WlH/U/P7tYaQIp67I5pZJsbNNCswqwwKMLVKD9rp8IZ9MrTwQTu8/xAtfYCEINag8mg5v7Xbwl8BAbwFMOC1Jv+S+Z1NcAFQjeEZGB1mzavB2lrff/6zwhuKFuf8onCmzkGGsf5eVlwV4Fhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776054; c=relaxed/simple;
	bh=WlwLG2zgBoJXDt29UJAUrZggw1Ut8UEnAV2Mrtzl3bo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GD+h5iDBtW6frrjxzC4D0QD1QjTsEzR1W2YuZ+B4nNkGyCCv30WnkX7bOSu0RttJlgYocXq9Wp0Z2yBChf1+AAyumkka78rUCrh7NlfheSMRchGk+Us3JMazcWeeIPzrpOyR+eSxhlzhuA4zDsJzUmY9j3bDqOYp12az7N/0wUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9qI7CNx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762776053; x=1794312053;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WlwLG2zgBoJXDt29UJAUrZggw1Ut8UEnAV2Mrtzl3bo=;
  b=k9qI7CNxVa/KX3IxOpg2AXFMLntELjnOC3uDBZh3HSKS7NTlhxBduo1n
   4sQ8G6/hHs6WW18vmdhByD4Ql/neLDk3jd07USHsIdf/RoGiX8dHfUQVb
   Oe2aNRHiWnMFxN1ndDI7+V36Spk4xcFhV2jmZXvdVWbKDV+Yu3OHHsz3v
   wYHGVNEduCHYSxc+xJhMDNylrRLATKrOBDHyUhQatT+/xeXKXPjEVJkDh
   fGWxzHYbh07GoGIIBW580ZP7wTEDx8rqk9n99saCcCjvAZtaco1EX7D52
   smtcKJfzxtNqxcUfiq0+f7Dwqc/dK9KkgWndRDNs0koww0ITAvSzkuGo/
   Q==;
X-CSE-ConnectionGUID: Ib8oYDOzSHqe4ocv9GI0Lg==
X-CSE-MsgGUID: XpxVTIZbTkikT9LWs70lLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="76274960"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76274960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:00:52 -0800
X-CSE-ConnectionGUID: 4y7kmFJZSf27/ZDP5D9ylA==
X-CSE-MsgGUID: NLh+SRyWTq+8N/KXzHihIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193040267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:00:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, 
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com, 
 Armin Wolf <W_Armin@gmx.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org, 
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org, 
 pobrn@protonmail.com, nathan@kernel.org
In-Reply-To: <20251102172942.17879-1-W_Armin@gmx.de>
References: <20251102172942.17879-1-W_Armin@gmx.de>
Subject: Re: [PATCH v6 0/2] Add support for Uniwill laptop features
Message-Id: <176277604087.8442.15648008989886648183.b4-ty@linux.intel.com>
Date: Mon, 10 Nov 2025 14:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 02 Nov 2025 18:29:40 +0100, Armin Wolf wrote:

> This patch series adds support for the various features found on
> laptops manufactured by Uniwill. Those features are:
> 
>  - battery charge limiting
>  - RGB lightbar control
>  - hwmon support
>  - improved hotkey support
>  - keyboard-related settings
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: Add Uniwill laptop driver
      commit: d050479693bb91da5a0e305ca9dd59f4c0b55dd3
[2/2] Documentation: laptops: Add documentation for uniwill laptops
      commit: cec551ec79c2f287d1eb048f70fe4bff66cc7d41

--
 i.


