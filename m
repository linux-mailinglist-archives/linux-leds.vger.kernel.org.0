Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0283382871
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 11:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhEQJiU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 05:38:20 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56748 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbhEQJiI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 05:38:08 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14H9OcxG177830;
        Mon, 17 May 2021 09:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=uLhCYe/UmtGS592Mljk+7IZPBQLfztu7v8PTMzg1RYM=;
 b=It4P8vaZTY35tVfpugQIegzTrvGyICEfKQHJXL2gOcCIfPIard6E6miYYUMEuyurpP4N
 Y7UZZ3moc/ZtrncX5XtV5KqBebapeuX0r20+aptV4EJLQ7ha1cgnM1D55UOePNuFvZ6l
 1G79kb13Ld0PdxCNOiCXSPnaAAl9F+v9M0N113ZDAHpBgXMH9PncVUIs7oYyqDTSa2mt
 ElX7QW/fqJj8jIBhB/iGRsaxLAKrxyjb1NPW23/fpZefhZX4dUDjUbS2ps52eDE1k5/Q
 r5C2Aw7gwVtVU5F1n1n/iKaPkwM5SizwTZvEKz+t++vBVs5cANDGQV/IazALy1yfC4nx TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 38j68mamr1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:36:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14H9PxGa024725;
        Mon, 17 May 2021 09:35:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38j3dt5cv1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:35:59 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14H9ZwBe045540;
        Mon, 17 May 2021 09:35:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 38j3dt5cud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:35:58 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14H9ZsuU010384;
        Mon, 17 May 2021 09:35:55 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 May 2021 09:35:53 +0000
Date:   Mon, 17 May 2021 12:35:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 02/17] staging: nuc-wmi: detect WMI API detection
Message-ID: <20210517093545.GD1955@kadam>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <602bd7c90e1e569f52db10bbe451af0436300b78.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602bd7c90e1e569f52db10bbe451af0436300b78.1621161037.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 0foXiYKSKv91dBFHYLZLPVvwPoMhYRpo
X-Proofpoint-GUID: 0foXiYKSKv91dBFHYLZLPVvwPoMhYRpo
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9986 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170066
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 16, 2021 at 12:53:30PM +0200, Mauro Carvalho Chehab wrote:
> -	leds = output[0];
> +	if (ver != LED_API_NUC6) {
> +		ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);

Does this need to be checked?

	if (ret)
		return ret;

> +		ver = output[0] | output[1] << 16;
> +		if (!ver)
> +			ver = LED_API_REV_0_64;
> +		else if (ver == 0x0126)
> +			ver = LED_API_REV_1_0;
> +	}
> +
> +	/* Currently, only API Revision 0.64 is supported */
> +	if (ver != LED_API_REV_0_64)
> +		return -ENODEV;
> +
>  	if (!leds) {
>  		dev_warn(dev, "No LEDs found\n");
>  		return -ENODEV;

regards,
dan carpenter

