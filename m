Return-Path: <linux-leds+bounces-3030-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAB997F3A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 10:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64FBFB23F96
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 08:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B451BE87C;
	Thu, 10 Oct 2024 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="gT17MCX7"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4D1C32ED;
	Thu, 10 Oct 2024 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544604; cv=none; b=iCb8dUOpEcovshLtGv02UU43eHA08Z4ZDWUQWImCop8ErwKFtg1uprRdg48LlX/VYEAEZk19a/rglp5Echt6BTlXflxNba4tcSHE+AEgvcpYSU3AEW0b3BtPzlBjYyfiD84TtaolT525TArNE7JcYUbe5ItbwBi969hxm2rdNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544604; c=relaxed/simple;
	bh=U043/IvxtfXo5ENHVd26fZEGCICWowG2M505O6EEoYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPPlfm7TYUiaYGvIfsQbb2KNcLTGSa8AhQ1gUgIkEAFoFzdBEe3XTsSjHuJ+N7QgDi/Up691qgz7bbCZ0LWDMxP/VjHBJJ48bOCm3JFvzbUNWlcAxqoBsJZ0AU2XMaEFrAua2qn8A7qGB3OgyeevKjr6FH8WAic0SYgXAkB0OqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=gT17MCX7; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1728544600;
	bh=839CLFCmcr9ZyeT2zFhBrjS3Lvk4P4QDdfvrVRmBdNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gT17MCX7Qi2FURhp/L6g4ka2r5yHiskXK/oxP1/0t7CNUchX2u+cxUjcIAjJUGrr5
	 xo4Q+3DKZm5APueZ31wOCouzO0wpVJ/oBsVUjfvGfKf9AT76iAXUti9otzgiC4sSvL
	 OWFt5paBypm/1vFXeg2/vxHItpNLq46fLXLekkxs=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 9641EA0104;
	Thu, 10 Oct 2024 09:16:40 +0200 (CEST)
Message-ID: <01486eac-b059-48be-a012-24166085bc7e@ysoft.com>
Date: Thu, 10 Oct 2024 09:16:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: lp55xx: Fix check for invalid channel number
To: kernel test robot <lkp@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dan Murphy <dmurphy@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>
 <202410101313.hQc9I8AL-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <202410101313.hQc9I8AL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10. 10. 24 8:00, kernel test robot wrote:

> vim +1130 drivers/leds/leds-lp55xx-common.c
> 
>    1111	
>    1112	static int lp55xx_parse_common_child(struct device_node *np,
>    1113					     struct lp55xx_led_config *cfg,
>    1114					     int led_number, int *chan_nr)
>    1115	{
>    1116		int ret;
>    1117	
>    1118		of_property_read_string(np, "chan-name",
>    1119					&cfg[led_number].name);
>    1120		of_property_read_u8(np, "led-cur",
>    1121				    &cfg[led_number].led_current);
>    1122		of_property_read_u8(np, "max-cur",
>    1123				    &cfg[led_number].max_current);
>    1124	
>    1125		ret = of_property_read_u32(np, "reg", chan_nr);
>    1126		if (ret)
>    1127			return ret;
>    1128	
>    1129		if (*chan_nr < 0 || *chan_nr >= cfg->max_channel) {
>> 1130			dev_err(dev, "Use channel numbers between 0 and %d\n",

Ahh, rookie mistake. Of course the dev is not available here. I feel dumb
as I think I at least compile tested this..

Anyway, the comparison is wrong and I still think it is not nice to
the user/DT developer to quietly fail here. I suggest to remove this
check here completely and keep the one in the lp55xx_init_led().

Michal

>    1131				cfg->max_channel - 1);
>    1132			return -EINVAL;
>    1133		}
>    1134	
>    1135		return 0;
>    1136	}
>    1137	
> 

