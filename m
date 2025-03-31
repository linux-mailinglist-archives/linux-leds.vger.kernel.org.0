Return-Path: <linux-leds+bounces-4385-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41ABA76C5F
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 19:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33913AA245
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 17:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C025F155A4E;
	Mon, 31 Mar 2025 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="PqtKfDny"
X-Original-To: linux-leds@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F1156653
	for <linux-leds@vger.kernel.org>; Mon, 31 Mar 2025 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440677; cv=none; b=YvE0jduj5VDUug8FPUF9mabFK2CZ8ZQxVQMDvDAQdoCvBGsKjzt7A3bxT5P/guh5XKcLfgPmfczQm5zbuX0CGjcB2z6KVkEclLlusaYg0XwHleprK5ngZdVIERMOECEfPFzKK/mrsr18W+HYq6F+pM49OSXwf/waAlSpURAsTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440677; c=relaxed/simple;
	bh=2L6EP6JOfk10SBtIH0G4/LoLBHQRoEG6pZl/1CPzjBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYbPpz8Cce49hr12WlwxULx7S+uCnZcbX2eITJ99iKtRoz4mhUd7RGz+8tltkF85SxTZI/OrDrEQJ6NT1nnoNbE+FbBfBFkg1FSLhNvozDrflZ/PV/Xl7NWpFB7eCYuFUHrgU24JCVY4T42X8HQWtgy8MDNuNh9RTyvEsbAf3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=PqtKfDny; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id zFwktaEhxzZPazIYntwznx; Mon, 31 Mar 2025 17:04:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id zIYmtqknojrgqzIYmtZkF3; Mon, 31 Mar 2025 17:04:28 +0000
X-Authority-Analysis: v=2.4 cv=PK7E+uqC c=1 sm=1 tr=0 ts=67eacb1c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=B0Ax0YSEZCTqf3FfsLoA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NHzeqaQOlIOLCz0gEK9qKDURR4cgQqjFM3L1Sny8MpM=; b=PqtKfDnyBBhP2w2r6Lv8/6YEoF
	DRPAAYgj39givy9jGUHP5zbaQSu/tv1T8UzVE4hDy6Tf9is2Ahn9R6sH+t8LHesBuzfLpHTWdTbit
	bZFEnpHTcL9Y/3OmW/4Mk9B3+Mgn9ESSudDuoDuujFeVdKAOHjsYzXcB2xH6Ft4GSS2FNM35M7wrZ
	zsHmXBGPZvHcafVE0jbILEbDhi31dA7oi3HjrPwhbBVbDYVI0Pg7pPDDoVwCyuAwl/4sHojlKrAza
	PM+eGadlcO6MFx9BMZZrUs/ufQJ8UZDpg4tn0dvHYr6tflTMJ2eGmwPCJoqAdfgVkvE0Rg4lKmDJC
	FmkJKVrg==;
Received: from [201.172.174.147] (port=34134 helo=[192.168.15.6])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1tzIYk-00000001eh3-2SVc;
	Mon, 31 Mar 2025 12:04:27 -0500
Message-ID: <0a1f5cad-3ebb-4063-bb79-117574da521c@embeddedor.com>
Date: Mon, 31 Mar 2025 11:04:02 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] leds: Avoid -Wflex-array-member-not-at-end warning
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-azMlPnP7nPPJrY@kspp>
 <c051fd45-7eb0-465d-9e97-af294c453755@t-8ch.de>
 <9a0401f3-fa85-4308-a022-c4205fd7b50f@embeddedor.com>
 <c5e292a2-927f-472b-a805-e70003319edd@t-8ch.de>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <c5e292a2-927f-472b-a805-e70003319edd@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1tzIYk-00000001eh3-2SVc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:34134
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDlq0P4+VWizhbfre8szotkePkf0lhVLTIDdvQr0eVxI2xMHVh3ar5A6bMXxlfdT9SEAVp3eQMsPLSuKD5ycdCuIapRBbdlfVQxnC1XKobDPqbp3/BVz
 zj1VpVoMH0afHyn5Ka9ve48ynRtgnJ0XrBzLqInTu4FdM40ocUIWFFii/CAjvehGXFfskuH4OlfacH1jjKrh0A0saixwE0c65wJhd6K9O8Ne0tceprB9mRpG


> My issue was with the general usage of DEFINE_RAW_FLEX(), the reply was
> placed badly. For somebody not knowing this construct it's not clear
> what is happening under the hood.
> It's probably fine in a regular header file with some explanation,
> but in a random driver it looks off.
> 
> The following is what I had in mind. Now actually tested.

OK, let's go with that :)

https://lore.kernel.org/linux-hardening/Z-rKcgFjsyKvd58q@kspp/

Thanks!
--
Gustavo

