Return-Path: <linux-leds+bounces-2474-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13039568A0
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42D61C20AA9
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 10:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CF3161924;
	Mon, 19 Aug 2024 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqpARSQh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827AC15B995
	for <linux-leds@vger.kernel.org>; Mon, 19 Aug 2024 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063706; cv=none; b=aWuFCQzGSHWzf8mABUZSjmZOVLk1CkPZuC1xa+evWvGAJS4ZvxBRXdnjcRvnQYbTN76PpZD47C7xLkziX9a5mSiuVtDEFMHaauwcxcSvHkP/CHv76vFNl4wy5uRGg7KXUgM6/2GuO3e6OmsCPQxMnTTi6vspP2S09SGScGFN+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063706; c=relaxed/simple;
	bh=C8cmAZ6DtMCK8UKjeMB4ciqE3g/tYE4h+B83nEaCixY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjCuLcXw8hB1fGRzSA/JtXwVl39rS6dAfYoGGa+VUy6B6nrXwMKFuUZnkIMtFyCsh7SdXwxEhoHZiXH4GeH3sTsZjqeYl/SpXqeckJ9O5a7GjkzW29dL+JmZRGsEOe0u4cF6nNGp/7WQtLzUrnG3EAvZXkQvlvO6j1dbyH6cm3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqpARSQh; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-704466b19c4so2408971a34.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Aug 2024 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724063702; x=1724668502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n0G/FT2pek0BJGYjowpKrU8vTGOyidDEZSmaRCBfETA=;
        b=tqpARSQh4FlORB4lf/levNhSIyjSdKqGJPSrsRVGhSE0jmGR6Y2WZQCjbp2pOfGr7p
         EefKpIloCC9E8YHFOQsqFWNjPwRDff1v5BzlLNPmYfC1/DdE1hwMd3xZEtcd1+yuVexl
         jIvf7Iug6J5FyIfGo9DG8wATqjZj7HW6xb80gEWuPgcxsa1EKa2rvGWuKbH13MD+PzXa
         EL4lP/K6AAuScAlDTmkrBK1Ezk9+G2DDM6ZLfT7nwgWQ21SZ2yegkbICTguG1mLxJyzV
         94wZ3uFadY8NRdkYqOvWyMw31/yNwNgGEkzUSmUjyPF9Tx3W3m6GS3RBYwfBb6ZnuDes
         uJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063702; x=1724668502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0G/FT2pek0BJGYjowpKrU8vTGOyidDEZSmaRCBfETA=;
        b=HIZ2yFyOF9/NRVr8mWpPBhfZ1AHrpCiI4UuulJH3hCg0zCDM9JrEaiyoLrPgFNRkib
         Xb2j18Y4FNjWfBslPiJCWPUe6DeQUkaG+sjZSzINKHBYvJ5ucHouUJjpURDBOjmtqSbj
         aKUzNHY5fbRqKjHDYz9mZMz23wuYT75uh9UmM8p7M8xpoKAVC/Fx1g/LYSLFIqhvOh1E
         OQdQJ2p5qs7CQu9eA1LK7toTKk2wrHVC4jJohyNttP7n8jorIeLFVnbDFDek0VuH8ui4
         Xb8GRa4aEAvvdAIpXtK97QdwmEeGUK0c+X4OR54V+ciILwqSx1MxMw2hhte+Xe+T/6yd
         l/jw==
X-Forwarded-Encrypted: i=1; AJvYcCU0JzcQBxJnjL8YMgd0wRNceRhgyXT+BqMvvq5/2b1/v8IQqcdtdvheZ9pjenGNVbEG02I3z3a/sahxArSyJfRzzOj/M7lU0XGItA==
X-Gm-Message-State: AOJu0Yx8RBReOAmgzofxDsaPMBcyrmECJyVw4umj5bLblxhuTslLC+WU
	SSYf9ZWG6vWeSte4C3FFs5rja1S1gq5+VO+YnBDsYi12tIIxKyTAWmcM+EWSpxqYhFlYv9BMntr
	SPLiv9pk4iPKTjYZK51VmORKyoWx4MFXV9CV04Q==
X-Google-Smtp-Source: AGHT+IGvfBJcsaH/i9fkAq46MlKF83AnLmTz2dPtPSQk73u0lGeY9eW9+SpkGNyUeKF1EmhsEC3NDjgKQWw+rxKqR7M=
X-Received: by 2002:a05:6870:3320:b0:260:fbc0:96ec with SMTP id
 586e51a60fabf-2701c55a28bmr12549846fac.38.1724063702596; Mon, 19 Aug 2024
 03:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-device_child_node_access-v2-0-fc757cc76650@gmail.com> <20240808-device_child_node_access-v2-1-fc757cc76650@gmail.com>
In-Reply-To: <20240808-device_child_node_access-v2-1-fc757cc76650@gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 19 Aug 2024 11:34:51 +0100
Message-ID: <CAJ9a7VgtK1AtjhM+i41nyDnza27gigg2JioC2xBmWkPeLBS0zQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: cti: use device_* to iterate over
 device child nodes
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <jic23@kernel.org>, Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
	Michal Simek <michal.simek@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 16:12, Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Drop the manual access to the fwnode of the device to iterate over its
> child nodes. `device_for_each_child_node` macro provides direct access
> to the child nodes, and given that they are only required within the
> loop, the scoped variant of the macro can be used.
>
> Use the `device_for_each_child_node_scoped` macro to iterate over the
> direct child nodes of the device.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-platform.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index ccef04f27f12..d0ae10bf6128 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -416,20 +416,16 @@ static int cti_plat_create_impdef_connections(struct device *dev,
>                                               struct cti_drvdata *drvdata)
>  {
>         int rc = 0;
> -       struct fwnode_handle *fwnode = dev_fwnode(dev);
> -       struct fwnode_handle *child = NULL;
>
> -       if (IS_ERR_OR_NULL(fwnode))
> +       if (IS_ERR_OR_NULL(dev_fwnode(dev)))
>                 return -EINVAL;
>
> -       fwnode_for_each_child_node(fwnode, child) {
> +       device_for_each_child_node_scoped(dev, child) {
>                 if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
> -                       rc = cti_plat_create_connection(dev, drvdata,
> -                                                       child);
> +                       rc = cti_plat_create_connection(dev, drvdata, child);
>                 if (rc != 0)
>                         break;
>         }
> -       fwnode_handle_put(child);
>
>         return rc;
>  }
>
> --
> 2.43.0
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

