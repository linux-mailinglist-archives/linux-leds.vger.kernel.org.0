Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A363828A3
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 11:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236048AbhEQJpw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 05:45:52 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:52480 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbhEQJpv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 05:45:51 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14H9P4hp139981;
        Mon, 17 May 2021 09:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lebhyDJwQ+Nghj4G/C13xVeGWekb205WSx6Qsh1yg6Y=;
 b=IXpEeMinWzibB5zmWE9mk+6z7u8KJMSas4aaYlYNR+tJ5m5Q7WdHnGw9cny7krIQsKoy
 WFOWPm05Ndzm9ObBG6d1OEiYN7vPiZgSuFdCDkuKQ0qUHkZ7qEMqyaKcXGKCXQfDUMB9
 i4EcLWQn9pl8U8K/Abb8/oZJaejKYd7bejwu8NOnNLjJwzMpat2WVI8COBZaSgscY4pO
 eEWfwkd128NjzE4Nns3UDJQcEaGij2UC/Ng5joaX7ua0mwfu7or0UanY1nKCA3kgsXt2
 eD1qmUQupyhAa+ONuIwQk5aM80KrX47fZnpLRyWScVgtsm+MWvdHQ5CjS0QzL4CgkHf6 QQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 38j6xnam2e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:44:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14H9P490030271;
        Mon, 17 May 2021 09:44:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38j644x06g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:44:13 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14H9iD0b180390;
        Mon, 17 May 2021 09:44:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 38j644x05q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 09:44:13 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14H9iBlh020956;
        Mon, 17 May 2021 09:44:11 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 May 2021 02:44:11 -0700
Date:   Mon, 17 May 2021 12:44:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/17] staging: nuc-wmi: add basic support for NUC6 WMI
Message-ID: <20210517094403.GE1955@kadam>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <ad868addca76f436d32cfbb3d8516d7d0dab83a2.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad868addca76f436d32cfbb3d8516d7d0dab83a2.1621161037.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: LKOdp5zMpMDzdJUD16sOQH5LSXI3JLdT
X-Proofpoint-ORIG-GUID: LKOdp5zMpMDzdJUD16sOQH5LSXI3JLdT
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9986 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170066
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 16, 2021 at 12:53:35PM +0200, Mauro Carvalho Chehab wrote:
> +static int nuc_wmi_query_leds_nuc6(struct device *dev)
> +{
> +	// FIXME: add a check for the specific models that are known to work
> +	struct nuc_wmi *priv = dev_get_drvdata(dev);
> +	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
> +	u8 output[NUM_OUTPUT_ARGS];
> +	struct nuc_nmi_led *led;
> +	int ret;
> +
> +	cmd = LED_OLD_GET_STATUS;
> +	input[0] = LED_OLD_GET_S0_POWER;
> +	ret = nuc_nmi_cmd(dev, cmd, input, output);
> +	if (ret) {
> +		dev_warn(dev, "Get S0 Power: error %d\n", ret);
> +		return ret;
> +	}
> +
> +	led = &priv->led[priv->num_leds];
> +	led->id = POWER_LED;
> +	led->color_type = LED_BLUE_AMBER;
> +	led->avail_indicators = LED_IND_POWER_STATE;
> +	led->indicator = fls(led->avail_indicators);
> +	priv->num_leds++;
> +
> +	cmd = LED_OLD_GET_STATUS;
> +	input[0] = LED_OLD_GET_S0_RING;
> +	ret = nuc_nmi_cmd(dev, cmd, input, output);
> +	if (ret) {
> +		dev_warn(dev, "Get S0 Ring: error %d\n", ret);
> +		return ret;
> +	}
> +	led = &priv->led[priv->num_leds];
> +	led->id = RING_LED;
> +	led->color_type = LED_BLUE_AMBER;
> +	led->avail_indicators = LED_IND_SOFTWARE;
> +	led->indicator = fls(led->avail_indicators);
> +	priv->num_leds++;
> +
> +	return ret;

return 0;

> +}
> +
>  static int nuc_wmi_query_leds(struct device *dev, enum led_api_rev *api_rev)
>  {
>  	struct nuc_wmi *priv = dev_get_drvdata(dev);
>  	u8 input[NUM_INPUT_ARGS] = { 0 };
>  	u8 output[NUM_OUTPUT_ARGS];
> -	int id, ret, ver = LED_API_UNKNOWN;
> +	int id, ret, ver = LED_API_UNKNOWN, nuc_ver = 0;
>  	u8 leds;
> +	const char *dmi_name;
> +
> +	dmi_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	if (!dmi_name || !*dmi_name)
> +		dmi_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (strncmp(dmi_name, "NUC", 3))
> +		return -ENODEV;
> +
> +	dmi_name +=3;
> +	while (*dmi_name) {
> +		if (*dmi_name < '0' || *dmi_name > '9')
> +			break;
> +		nuc_ver = (*dmi_name - '0') + nuc_ver * 10;
> +		dmi_name++;
> +	}
> +
> +	if (nuc_ver < 6)
> +		return -ENODEV;
> +
> +	if (nuc_ver < 8) {
> +		*api_rev = LED_API_NUC6;
> +		return nuc_wmi_query_leds_nuc6(dev);
> +	}
>  
> -	/*
> -	 * List all LED types support in the platform
> -	 *
> -	 * Should work with both NUC8iXXX and NUC10iXXX
> -	 *
> -	 * FIXME: Should add a fallback code for it to work with older NUCs,
> -	 * as LED_QUERY returns an error on older devices like Skull Canyon.
> -	 */
>  	input[0] = LED_QUERY_LIST_ALL;
>  	ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
> -	if (ret == -ENOENT) {
> -		ver = LED_API_NUC6;
> -	} else if (ret) {
> +	if (ret) {
>  		dev_warn(dev, "error %d while listing all LEDs\n", ret);
>  		return ret;
>  	} else {
>  		leds = output[0];
>  	}

Delete the else and pull the assignment in a tab.

>  
> -	if (ver != LED_API_NUC6) {
> -		ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);
> -		ver = output[0] | output[1] << 16;
> -		if (!ver)
> -			ver = LED_API_REV_0_64;
> -		else if (ver == 0x0126)
> -			ver = LED_API_REV_1_0;
> -	}
> +	ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);
> +	ver = output[0] | output[1] << 16;
> +	if (!ver)
> +		*api_rev = LED_API_REV_0_64;
> +	else if (ver == 0x0126)
> +		*api_rev = LED_API_REV_1_0;
>  

regards,
dan carpenter
