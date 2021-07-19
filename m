Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E187B3CCF12
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 10:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhGSIJP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 04:09:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20754 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234933AbhGSIJI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Jul 2021 04:09:08 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J823Ah029512;
        Mon, 19 Jul 2021 08:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2021-07-09;
 bh=qkbBBOHVcLXJb8mhuno/hvAYSEtSbY00JpzTRlYZLxQ=;
 b=iygnxZ2zd+wrH3Cb/OOUSIbTUce3kSmib/qbFGvxXPT1sMLC2wU1S8WNmb8GtuaXcES0
 1uggxbomV4bFtB/aYb3kGuoNH37lb0ezraEnbpoHGTGYIfSx0ilUETqvLAPsBycjBmYz
 aV7ySfBVN4hXRcAu/elwK40qiIrUD1d38Tywug6QhogaI5zFyEwgyBx4j1r7MpzSPW88
 x1r5W3y6xTaxFwn3KYEoFCI25RRMNVsr2oQN/xRdHowR5TQyBo8NlE7o/PSuvjAEV6/T
 dvsaBQ+stqSeMaoHGjFL8QdqDGzZf7MrDwaNU29/hCK8lfpHiBcTUyE0D8YHTnLRCK8Q 8g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2020-01-29;
 bh=qkbBBOHVcLXJb8mhuno/hvAYSEtSbY00JpzTRlYZLxQ=;
 b=wQzUckSzOJJjzIqL/Nyafd43Z91KoRAXAvIIDQo0K1bcPFkIaLS7VDXgP+dtVL1c+Ojg
 QtJ0MF8ziDs8Pl20KtJMsb7+XQu/ZL37CswzCqCKvRlYOW94mijF6kth9TNUUYiwudCO
 9oy0xGwBN18vS0VzFGI55LwEYOvoBQAChW3Gm7cjIzlIWyY0EurNpbqs5TC+526rgFBQ
 8e1WWc0esMzem/3mVvQp08jQwFRjLzhek90GZHjFbVCK2MZ4UZy8PjXjLZLTWZfl7eie
 x/oUY9OINMvrAZT/DI9RhRRd5ZkmDrX5TkfnYnARm/Q0KQe3Kkgei2Ebqwy4srCe2Mnu aA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39uqrtjcbh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 08:06:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J80D3C195670;
        Mon, 19 Jul 2021 08:06:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        by userp3020.oracle.com with ESMTP id 39v8ys70q3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 08:06:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld7fzHfMrTp14bZgQ4ByAxmhXOKOQbGXH3R+oc6YtBOSRdXPYRYPi7btcox4TnbYOSOwqf0MtMsqueNi/aREBGbfPKMxi4G6xWrT9Zf1kgSnARTtRxfYTG5DsHR3I9d4NsFVpW3eCQqB+xNhhashQaUD9XVRFOjOKYxmEjTovTDDvd7ZrP2jxrUIy+aoMn2u3exs3XRwwMrhKG5KgYUyJbaREcKGZFdWo0cYJi8XzkOfDDFPUCgH6Vb2RbOwD4KQQDiWpJNclzMzEOClvg/zd41DlGOswceDdPdEVKnY8E6NlCQXfxGNMJzCCpaWPGwE8yKLn7u/NVYXqtYrcJrEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1wRZ8RcX4b8juijc5AKEkyrUbSdn5YwlCLKXy9aVvg=;
 b=h4jQE8x4pMMZ9/hFU7StSjD2ZcXx/jSYdq2SPuCM+UQJs91QSpD1KsdtMgWUB4UN4AdDIr3RQFisXm8fEmZwVgePEgBW/usgt9hnFGHI0xJSBtcIv8viQjbFhDVP8AWMiPteZyTLmCp6JMYz1fAOdGqsfeFWokq9YE68a9ipKjxCMOyRdzJGMxM6SZ5ETLl4OaQbVyC6sxAUK6a76qIAvn2yE8BYMYET8keN8NShwmshY2rCFQrrCMER57a3IhVSaS2jw1PKHV4NBl3BwCWEqjCPXgAXhCaacXmd75FAQ0mbMjXKvqpIbLdBWOUG+ug7qN1FnlRu0l1nRjH3QPdTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1wRZ8RcX4b8juijc5AKEkyrUbSdn5YwlCLKXy9aVvg=;
 b=h3hEA+wOX/eCNspZ1g+wQNthO5o0cKlbnwyOGrxE3t8a9fzPAWgjm///uoS6Y1Nj7ZHbzW5VlWVOhTNd4zTshGvmHCCyuCN5rxNyMvccPepl1IF01ES55O5fyTqac/7Dl3h+PrF3EeDMwnSiT5UW+fMuFvWgmbzINDOszZHhJq8=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4689.namprd10.prod.outlook.com
 (2603:10b6:303:98::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 08:05:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 08:05:58 +0000
Date:   Mon, 19 Jul 2021 11:05:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Amy Parker <apark0006@student.cerritos.edu>,
        pavel@ucw.cz
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
Message-ID: <202107161044.asWDkkC7-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 08:05:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4d47ae-bcf2-4b73-5a63-08d94a8c0a9e
X-MS-TrafficTypeDiagnostic: CO1PR10MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4689542D36319FAC3F607BB78EE19@CO1PR10MB4689.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Puke8BWWvfvhfTPOpc9HpGr/r0O9SYSNPJ7HGHmxILiGD4hm5DBACDw4iz5Yzk5gPuDe/gMStPd3gAWKvHY5hPfl6XKq/x6DXs2kbEt+QA/tVYSXYRoJ90QLT0u1KxqJJ3b3V3jmMZg1Agr+fFrzRorBJQrcLVczs4xHVZFQi6mh6+fdvDVIPZbp3zCR/2bqhjMOGYi0BmI4OkrANS6z/Ik8Kp1O9epPyw9AE46JHvmdvHsXfbH00toqOa58ffpu2Y/CxMfb3v8ZlQL2xmeWeYXl97UmAdFl8NivgReOpnDdD/Xr8LmCPH8lPc2k4csRREHAw5PNYWC5y34gDUY1vng6xXK1WZ5pBoGu2QhC2Tzm4PNnQ/1k+KKejPhyKjyYcmeElbE52PLQSVnTOaLfWdiOXtzpWsTaWNsklc0Bh99yNt63acK5jAUKgZwDRrWpNV1TknfXnMceSWJkgtE/ZDISYaNWXt/aq3JIIHTm1CpC80/bTZWSD3CfUOtS+7oiojWUZEE5LjWBvY4ZL9rwdS5eN6MoVcNkItRIIOWNVBalnjORmkUctJ+7pQC8TL85NoZ05ZwKMI/wmmOAmToTv7A65/p9/FtjDcotokyeX4QygU+3EwVTgez/vtaj+ZBvy+JhedpaGKoS3lJnXMvf3ze9jRGj4yXCAO4rOdJF//e1Hgz4KTnZibn3dKAyOLrbRyZQa+YUKGVqJJl47JFt4gKEqlDsuOvc9YpQez7B7wV4JDmzX/+z7tG/DWgWPiVF74tJw/eFS/mqdEc1wZL8VM/1Zlimiwtb7NMVhZFGtyx66Z5G2VHnqwTk6HDIPNmv99aNkAOx5YmnGnx6I13UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(39860400002)(346002)(366004)(478600001)(966005)(86362001)(316002)(6486002)(44832011)(186003)(2906002)(9686003)(956004)(66476007)(6666004)(5660300002)(66574015)(66946007)(1076003)(8936002)(36756003)(8676002)(83380400001)(52116002)(4326008)(38100700002)(26005)(38350700002)(6496006)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9un6DJEKMhiWDIhiS9TRTJqNZL2sc0kslRdDxqSOAb+xNb644vsudDKbpS?=
 =?iso-8859-1?Q?BWohF3A+h0EWt8QL+kmQTqhlKxbm98Vwsn7c5b1yfvssBgRjleNrnXEnj6?=
 =?iso-8859-1?Q?HGsVGqgID2QcncW4DXXiJAWW+WjeJ+2yDjiBDbAn9W/CELYflEqMdSHQbn?=
 =?iso-8859-1?Q?pmp5sMwq5vRhBdec5gvyqlwUVNBHnDwol4X0cwT5+t3xUUSbr/dEAW0fIT?=
 =?iso-8859-1?Q?jIpVY9ASNyXFfjUmGKJuvSlS8RkShRmTLdNXijOU8TI4An1x7i9nH4SoX/?=
 =?iso-8859-1?Q?LHulgkV6SVsykQOvOZslwWFvbigQERDq78dNvemf7Ef0THCkzL14ANXG4a?=
 =?iso-8859-1?Q?wLm1OBEqhMfxXL4IqI3w7eM19izwD3b3tyvnXiXIbouPZ+3s+Eim/k8Lw6?=
 =?iso-8859-1?Q?5Bsr+50SmGbVEbVfP5lLBkh7IGFRiN8w/n6fdWWjQ7iKAzGJnqJBdQ55HG?=
 =?iso-8859-1?Q?2JEYYZSZ1JdQew293UTdyaFPmv1HwP+XR4bRp704dKwu2XNcDRhfBkKrIt?=
 =?iso-8859-1?Q?L2Zcvjy++EqzaKF9jqyc5e6RXz6//HIFY85MeP6zWdNZACTlBKu3iPPQn0?=
 =?iso-8859-1?Q?yHXKiH+w7sY3lEDIH3ewrdtQ5JxcnFfZ9CodgXn7fQSyM9Rf3j3gEOlqGL?=
 =?iso-8859-1?Q?lw3d2nkxQuhbQWxGgS+z/ici4RUwuvFCYGbjQXlHMLI3dTZbgObboVLbIC?=
 =?iso-8859-1?Q?Yn6ljbT6fG9eHDY1TidBXlJULmvV8+oGQWiSfEoRrlVes9IIMeGJK3doA/?=
 =?iso-8859-1?Q?UfV9c5GrHR8eBJ998gTUpTU22A7mFki56lIfGlTV/q66YJAmpChD1yIUiS?=
 =?iso-8859-1?Q?BlnS6PFZ9zla0+k4g0gbmerKkWhAyrEEYXtC4GNgwB0rapoe9vDALkUn5D?=
 =?iso-8859-1?Q?3cW8o9hsidLjlbxWMZ0GznLrRdJ502N5BjDjqJWqon34yCfkERa0Wc9mSv?=
 =?iso-8859-1?Q?14YJPIWbcJFlXFgAzuRRYOhCs5vfzzzaB+EzOGVuP57sxEXqv0366PIhik?=
 =?iso-8859-1?Q?VF0XaHUNbPAYOtk8LNjIFJFw9oqYVRvDYaUEQTiFGQQsUdZM9JpK4amf89?=
 =?iso-8859-1?Q?+wnBhdV10GLwLZ6jB7csG7P6aXqjWPgouiBKvjwbpyytIcIQ48iyvjSoQV?=
 =?iso-8859-1?Q?LR+wTfJKVnBWVi6T1P0UtzZBWH3h7tofs3uFDiPBu9qE+TnjeFxxRI26jP?=
 =?iso-8859-1?Q?egcJWqAuq/8eqBw9CVhTjCC/HIZS0zxJ90LKmbUr3HHBEKTVP60qNVzOti?=
 =?iso-8859-1?Q?Dd+fTUict1ngn+uvN6RBNg9Ff4QMlV3pkNPXnXZNdjl9zJNZVs0BhBMvKy?=
 =?iso-8859-1?Q?W6UVYd3eA8VZUFvbJRq5CVmA/1JdM6bguZDF6/4fn5NnWLx/xsVzOfrGna?=
 =?iso-8859-1?Q?DAfJUP2JE8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4d47ae-bcf2-4b73-5a63-08d94a8c0a9e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:05:58.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Iwv0Uj3eikQW34M/RJgBpKwZ8kx3sG9OEbobxNu+pH3OOEkyGgEEwbPyhApOXaAul9lh1KKrSaJXW21FXk3Hm379lEZHO61GedjWU02X/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4689
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190044
X-Proofpoint-ORIG-GUID: i8IgKj5Fh3siQnu3NsOB-JASmj3_yrf1
X-Proofpoint-GUID: i8IgKj5Fh3siQnu3NsOB-JASmj3_yrf1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Amy,

url:    https://github.com/0day-ci/linux/commits/Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd9c7df94c1b23feacd54112f33ad95d93f64533
config: i386-randconfig-m021-20210715 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hid/hid-corsair.c:157 k90_backlight_get() warn: signedness bug returning '(-12)'

vim +157 drivers/hid/hid-corsair.c

b14a971f104520 Amy Parker       2021-07-15  145  static led_brightness k90_backlight_get(struct led_classdev *led_cdev)
                                                        ^^^^^^^^^^^^^^
Just declare this as int instead of typedef.

6f78193ee9ea55 Clément Vuchener 2015-09-30  146  {
6f78193ee9ea55 Clément Vuchener 2015-09-30  147  	int ret;
6f78193ee9ea55 Clément Vuchener 2015-09-30  148  	struct k90_led *led = container_of(led_cdev, struct k90_led, cdev);
6f78193ee9ea55 Clément Vuchener 2015-09-30  149  	struct device *dev = led->cdev.dev->parent;
6f78193ee9ea55 Clément Vuchener 2015-09-30  150  	struct usb_interface *usbif = to_usb_interface(dev->parent);
6f78193ee9ea55 Clément Vuchener 2015-09-30  151  	struct usb_device *usbdev = interface_to_usbdev(usbif);
6f78193ee9ea55 Clément Vuchener 2015-09-30  152  	int brightness;
6d104af38b570d Johan Hovold     2017-01-12  153  	char *data;
6d104af38b570d Johan Hovold     2017-01-12  154  
6d104af38b570d Johan Hovold     2017-01-12  155  	data = kmalloc(8, GFP_KERNEL);
6d104af38b570d Johan Hovold     2017-01-12  156  	if (!data)
6d104af38b570d Johan Hovold     2017-01-12 @157  		return -ENOMEM;

Negative error codes

6f78193ee9ea55 Clément Vuchener 2015-09-30  158  
6f78193ee9ea55 Clément Vuchener 2015-09-30  159  	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
6f78193ee9ea55 Clément Vuchener 2015-09-30  160  			      K90_REQUEST_STATUS,
6f78193ee9ea55 Clément Vuchener 2015-09-30  161  			      USB_DIR_IN | USB_TYPE_VENDOR |
6f78193ee9ea55 Clément Vuchener 2015-09-30  162  			      USB_RECIP_DEVICE, 0, 0, data, 8,
6f78193ee9ea55 Clément Vuchener 2015-09-30  163  			      USB_CTRL_SET_TIMEOUT);
7a546af50eb78a Johan Hovold     2017-01-12  164  	if (ret < 5) {
6f78193ee9ea55 Clément Vuchener 2015-09-30  165  		dev_warn(dev, "Failed to get K90 initial state (error %d).\n",
6f78193ee9ea55 Clément Vuchener 2015-09-30  166  			 ret);
6d104af38b570d Johan Hovold     2017-01-12  167  		ret = -EIO;
6d104af38b570d Johan Hovold     2017-01-12  168  		goto out;
6f78193ee9ea55 Clément Vuchener 2015-09-30  169  	}
6f78193ee9ea55 Clément Vuchener 2015-09-30  170  	brightness = data[4];
6f78193ee9ea55 Clément Vuchener 2015-09-30  171  	if (brightness < 0 || brightness > 3) {
6f78193ee9ea55 Clément Vuchener 2015-09-30  172  		dev_warn(dev,
6f78193ee9ea55 Clément Vuchener 2015-09-30  173  			 "Read invalid backlight brightness: %02hhx.\n",
6f78193ee9ea55 Clément Vuchener 2015-09-30  174  			 data[4]);
6d104af38b570d Johan Hovold     2017-01-12  175  		ret = -EIO;
6d104af38b570d Johan Hovold     2017-01-12  176  		goto out;
6f78193ee9ea55 Clément Vuchener 2015-09-30  177  	}
6d104af38b570d Johan Hovold     2017-01-12  178  	ret = brightness;
6d104af38b570d Johan Hovold     2017-01-12  179  out:
6d104af38b570d Johan Hovold     2017-01-12  180  	kfree(data);
6d104af38b570d Johan Hovold     2017-01-12  181  
6d104af38b570d Johan Hovold     2017-01-12  182  	return ret;
6f78193ee9ea55 Clément Vuchener 2015-09-30  183  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

